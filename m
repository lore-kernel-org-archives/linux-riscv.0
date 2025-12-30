Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD8EEE498E
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rbu+If/nTyIfgYTiV8fncdHMJApHSmYW3nUODFXFj0=; b=CCs+YyFbcI9E4nF5d6o2trKcwF
	TYQKPsB4qGhTTBBEhB/wEgcKxc8d3tc1T6YGUGWz01tlJAyZ6W1jLRBmNhLo+3Sq0HAaOjJqhbOXR
	69KR19PDNzPVWwyjRWC2DLIXMAx+eiy2/OsO0oigWOpfqRrY+INz8XIuHz+qxH9e483MzWlSm1I3A
	zCQjRGZVCvOAGJnucw8OfGKQGOzeo4R72U45sjaACAQMuAYEGAAoAwhH4XpHlbhTBrRO+NxVgqeVJ
	lcSWXHq82orT3Bh8OD9CvKdh1CdqMrx9fzdQSltbkbd+qf4P5+G1C3OrYJjy24eRLO4Mvy1r6xtLI
	GrwS5JNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vad3x-000000055UC-0W4H;
	Tue, 30 Dec 2025 16:59:13 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vad3u-000000055Tp-3nuO
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 16:59:12 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-6446c924f9eso9006620d50.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 08:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767113949; x=1767718749; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=e7iaZQUfoJGAcPE8lYcFoib4ZoHsjsBS/p8CGMlOvsrHSqFrWhxYTk7qEJC1pF/Z0p
         MZZ1hBXEB69B4LIvQ+5ErR8Wt0hJ9QSHaTa4Vx1odlTOyxRX/lX8YvxKWNC8Yg9RRx8E
         qG9cPsdXLCZj86slgLVgUKHJ3W4g4ttDRN9DenpWdPv5cJ1M2V6yx+jhfXY1RcwAgw4G
         S3URbpenAeHO72BFbumr8bNyKXEkAAmdQAe/Tx4+R5jJOqsOxtCoRXi0OddYXTV6epCI
         TA7RV37OfBLPYAO4zwHe8gkCjoSWuqpb3+yr/NWkQvFzaZ5XyqWVBg8I+fvkyQQqiJaR
         4AFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767113949; x=1767718749;
        h=content-transfer-encoding:in-reply-to:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DRDjCthMH/qjCzj5SkNL4SRuuhJchcrlyUpx/5Dmle8=;
        b=Zy0TswyEp2pBov+HNHkAqMruJkwubzlVXa2Xdu7HZNYFDUXGLg/KCDo5tKBbbpzuWs
         XDtDyplzov8qvnErRImu4u87FuJKPW26oyyyuVxowiCarevDhZt+OvSo6O9CfjZ8tmmV
         +3Y1Yfaq+7ljNIvIx58wSwq2JALVFKxGiOG7063/Mp+lancWGaAu2pvKx0UC48D+FP7s
         IHkCkabs3dytN4/n2St3aCxYZ1wxlNLggEwd84WuMPm7U6Zp14qdOgvYC/wKYLexabzf
         iEZtCNa9R0GosXhmo2uIrPsd0PQIhu6GqpaJy96UR7Tcjp+oSX++24nxObLeP/qbJJPT
         /IJQ==
X-Forwarded-Encrypted: i=1; AJvYcCURNrGAj/5RrBu7felG9OHh1b1JHIvctZKceH9tzQA5NTSuNhU0eUzpdEOrCg3e6JwJgl4ymDkoUJ630Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz4Mr0EqEtQRFeJg8AN1meXUnya0wuzRK4KTRGz7i7iUknmD9T
	ENXbYrHwEZHt9I/E1oo/7Z7L3LYv/zzd0ChlrJHUGF3ekbW+U7/YnIom
X-Gm-Gg: AY/fxX7h6C2Yoe0XHggKwIjtwsxgEvWmOsmh63/8Z3M9WMKWGnJpYmGX5eGbZ2Z3WJH
	T46z7od/OCpQ0mVNoTKg0VuUX0cWwMXt9Ez1PskbZX+B9UFx0xN1uZhyrPPqymVviY7soET4tmL
	2zxU8t/h7juJaXGaZ9DlwvU1ZD7+1XZBQTomZBOaEuHel3GuaEIHoquBbm1ifPfXSzFaT0uwQXy
	fIrhIOi/+FNuwKDaCvjyqOfeaV81Lliu4yAQVWiOvlgwmd7I1aHa3/hEO+M3Re7FZ0tBItpg7Dz
	cRfRNgEycvVm3Xx/ybGh96T4+EA/+s8fMFWviUThufvex8PE+x0G7ex5svycgMVWn45LhZXYlRf
	Tp7K1v3veSBCLRrFKLystBSbmzGr/1A7aO/+CF42dC0VR740EcHSxGcxqCVJUroTrlE74yIWnpx
	nNRNr6tHCDknYSNE7iDh2PrL97z7VXbva/0OPi741c
X-Google-Smtp-Source: AGHT+IH2V57ZyrIGYmhMfY0baEpBO+dBiOAau3e5WvXJCMGvc5QlBIWU/5RRYx65BeBxQ6CEQap2dA==
X-Received: by 2002:a05:690e:12c9:b0:636:149a:f54e with SMTP id 956f58d0204a3-6466a8a5c84mr29092072d50.37.1767113948961;
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
Received: from [192.168.1.209] (74.211.98.217.16clouds.com. [74.211.98.217])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6466a92d913sm16230434d50.20.2025.12.30.08.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 08:59:08 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <f462b3e9-0650-4d5f-ad60-96e8f1e39419@gmail.com>
Date: Wed, 31 Dec 2025 00:58:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: xinrui.riscv@isrc.iscas.ac.cn
Cc: a.hindborg@kernel.org, alex@ghiti.fr, aliceryhl@google.com,
 aou@eecs.berkeley.edu, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 conor@kernel.org, corbet@lwn.net, dakr@kernel.org, gary@garyguo.net,
 jeffbai@aosc.io, jmontleo@redhat.com, justinstitt@google.com,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 llvm@lists.linux.dev, lossin@kernel.org, morbo@google.com,
 nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nsc@kernel.org,
 ojeda@kernel.org, palmer@dabbelt.com, pjw@kernel.org, rabenda.cn@gmail.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu, wangruikang@iscas.ac.cn
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Content-Language: en-US
In-Reply-To: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_085910_951571_85ED38D5 
X-CRM114-Status: UNSURE (   1.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I am replying using my previous personal email address to cross-verify 
that <xinrui.riscv@isrc.iscas.ac.cn> is indeed my own.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

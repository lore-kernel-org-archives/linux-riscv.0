Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C374C2A062
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 07:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xG7JbrGp+qUi6xD2Qzojtc1uQoSTRfuHTFFwiCn2sGU=; b=esy5Qzb41M75kH
	VkUGR6yBCZCM0sxo/vgVraLQXEPTx5cwHiiPe2gMJtIlzs+jp+e73LCUldytO+H3FscNd64gTP8Ci
	nNQhLnyLu16KvdqzFLxg/XHMbVz/DE+Jfb2ooK+LrMe6aQnMTmQhOorRJGo49xDQqwamhalGnzwjp
	E1oQu56fSxzWD+u5CuzRvsI3IRLgfNV2OHQm03HktcDiRdm5iUGhAA7/tKRfcYFS+aY5wi5ulvazz
	T8pP6DQu3HcwrcH5iK09abQiqf3Gg87d1GMCMqUx09QGGX9U3cJ74rpTyiiTfdqyV1DVBUjnrftt8
	Q2CP5qi2PZLekW+jB1sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfJQ-0000000Avf8-054u;
	Mon, 05 Jan 2026 07:47:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfJN-0000000AveU-1Iez
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 07:47:34 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c227206e6dcso13332020a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 23:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767599252; x=1768204052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=;
        b=BiBPPtyqr4IQCbYYfTBKfXz1F7mRwBl5bvagFOFJIVnaJF2QTrrWpd/YMcgor5mEC+
         qNnIwWmrhI88sQ6MXAnKtZ0I3G/0FBHdfQ9YVvoLU536U17FFheESm1FL0xpj630U6de
         RgqVgG24GGLPrgcGvbT8H1dzjdC/4DojBqOKr/E4UPKEDPX91ZlSxWJS8LjAuK2s/itO
         joyeFm6ql1JsgQ1/+d8+1j4gUjrbzc3zhkNob4vzH1X+604bisj9i/Ksu2r1Gn8kPkD7
         TF+s0YtHeF/VTeLTLblJnuPBGeCn31p5R++YAP6RkcNvJSFXPXbMTY9ntRY1s6b4Pg0h
         Wjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767599252; x=1768204052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Smn7G9NNF4TKpSBrLZt6/rkru/ozPf2jYkxgsCOt/U=;
        b=jDHUYYtp9/wkIjGoRpl9ZSsSJJhXfOxwMIDCWX6Ov1dC0raES8+iGd6zKfeuGmSWsf
         PtcMkWC6rihg5qgDume+s0giVUyh9bitlxyCFy1V65I6uQeLe9z9V/E+ZhcamRwznfWG
         0EJN9UgWticYq/eQEDAQpbCb09ULaRLILKCi1SKl/erITj3Mg+eKoodSHfENEHcXBfQf
         azu5deWAZSEBAy+6BE3cQFGbFdzrepAsd24fsizwnCV3zcnst0gNPeEz9WDdTWAKDLNr
         KHzK5FeGH3tKJEdbJ1oyWPJlU98/lYQlfirxp9o8NWsVJR/V8ljrZkVSIbNIXypt/MGb
         Ym8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXij8w7QfOE7hypk96VgRSHlBt83yUQYtJW6owj1+neXAUdS4Vv7avlKeQuM8uVAHL3cBAfbBpx3a3qew==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPM9/gptu2tP4LnxvgpWiNAYqw1HfAOk/5HGS2rTB/74RmbXZ8
	T3M/DdDzE4GMGKv+EU+gO1n6TSiUmRqIrGXH+7IrgRt1dkdoLSbQC73J
X-Gm-Gg: AY/fxX5JBee6lPTjdHvSL0fLMmShhoPLyHRg9uvcFQDt+NiQjQl+II0qrMAanW3ZMXc
	mpBHd753qKFYuKZY/pkmkED+zzrZiyauDOWG3Prb2C0/XDxRJuI5898/qdwntA3mJHZUWWqp1bY
	O9ymzbaq7YKQ4sIKW+Nkwz2NSsEQ9vNyBLQmE/LtjR9tNfL/d1HKgH5YjtTBuz+jx2air6/Yhb6
	18a8X3haU6LJyFTKw4DF1YSvsXcGDxh3D4ckHpBZu7Bi/q8U416rnC2GR041CYBZZ2hOg/Ep9Ux
	PM1ldXkd/Fne+FdFzpr2PBXC9aWO5XaW3z4lUfbECGGdkZoSeQFTmI2IngdjcE7zfH9wI8hHpUp
	6EX4A1r8n7LyJMgWEOmsySJQ+nJxhLrcOVCudijZ/yxJcKfjOrnPprgkVDbtxNHqGUAdAGjLS2w
	==
X-Google-Smtp-Source: AGHT+IHVaBHzL3ldcoq10mQ0DvSoQNAzO29+h1IBrSy2gZY7Qh6quSoh5XWNmgIvhDzcT+gz+HyNHQ==
X-Received: by 2002:a05:693c:8008:b0:2b0:4f8e:3273 with SMTP id 5a478bee46e88-2b05ebd7223mr36936529eec.6.1767599252090;
        Sun, 04 Jan 2026 23:47:32 -0800 (PST)
Received: from gmail.com ([2a09:bac5:1f0f:28::4:33f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffad66fsm101610210eec.4.2026.01.04.23.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 23:47:31 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 02/36] lib/crypto: aes: Introduce improved AES library
Date: Mon,  5 Jan 2026 15:47:12 +0800
Message-ID: <20260105074712.498-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105051311.1607207-3-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org> <20260105051311.1607207-3-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_234733_352737_72CD7472 
X-CRM114-Status: UNSURE (   6.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4 Jan 2026 21:12:35 -0800, Eric Biggers wrote:
>  extern const u8 crypto_aes_sbox[];
>  extern const u8 crypto_aes_inv_sbox[];
> +extern const u32 __cacheline_aligned aes_enc_tab[256];
> +extern const u32 __cacheline_aligned aes_dec_tab[256];
 
__cacheline_aligned puts the array in ".data..cacheline_aligned"
section. As a const array, it should be in ".rodata" section, so
____cacheline_aligned (note the extra underscores) should be used
instead.
You can also apply the same to crypto_aes_sbox and crypto_aes_inv_sbox
while at it.

Regards,
Qingfang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

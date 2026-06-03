Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CFCCD6E5D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 02:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MIW+xZoj3g6r9Qx1qjuvEa0neEA2EgMJ8I7tC1d6J0c=; b=zC2KyEHtJ/Z111
	BFZtIPJqsto+UaWUfStP0kUeXe2bcmD6oT1odO2jf9C60Ig+U/0xdqU7x16Y5fHr0q0oor56w3tjS
	61A+QHSOYZBDTNlVIjL9p1vwlHOl9p8Q9MbuRu0y+ACilfKsc2QVsYMl8UQ9J7fZzedArMeH5ezqt
	tJEmeikYHjZRZoX4SFI5WScXRlg4V8MmH4dBYGCVpiCBXkUygUdqYd34yZturixnuBbJcOSBJzvli
	cVjxKM2vt3uku/UowKjvloxpdx6ZOJ+41I3gcvgMYoIO6UpjtYskR2ysuDdEkZwoUoOsoPVASXNvA
	L1LQlzj6rSWUiwMUeflg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUb4v-0000000E5W5-19C2;
	Wed, 03 Jun 2026 02:11:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUb4t-0000000E5Vi-0qfV
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 02:11:32 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf1f074a12so51386735ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 19:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780452690; x=1781057490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+L9YaFJ+m4ellFTarKqsN1ZQFZp0gqbz0P+NkIvUIc=;
        b=T1fFb4he8OYClism9uhykQbZuc3EsEHoIp9XNPwhy53zZqx2lDyMeQ8hIQ2n93gGnV
         5IUvakvKyLX4I/btfUsogTKKzX7zkaEu28T7pYi5VeEO+oF3ZJIZUJ4+O2Zfjbhvvqij
         Ltk2h3WUOV3ShLvx1vJmITM9yL32/8Yg8uvfIG4JtJQF2rtI/GOIv0SgYSx+ZaTrSjdi
         5RDLJP7AML/GZ6nLGHJy0SfcIOgFZ4cRTG3iEZRBquyvU4fBMdabgVOT18XJONt8hCDF
         5bJH7wqTsTxEKDWUf/GT3p78ghsN2dj4bEbXHre/w4nHhmOQvK3xvxVg3Da3oagq6As5
         TjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780452690; x=1781057490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S+L9YaFJ+m4ellFTarKqsN1ZQFZp0gqbz0P+NkIvUIc=;
        b=RJ4HbwuDMqUi4X10A7hxCrgx1A6xpTxrkJEcRFTzm8xulDfCJ4KyLHAckvrMuQX/BA
         hPYp8e0EvhN/sMR4VJgbLwGVzDBLRATl2WcBepE+XJ74CJhCHTbfYjxuaoEBiPjIUpXl
         Kzd0VERG3ZK2uOeljrSWoxNV+gE/XEJbvSe4imEoKYVWA8I9f29cazrESuEBXSN0tVdO
         IpSKYvluo9lG/vjHcWDmoAQqQFI9L1NtCtAyBFRc4NXoLkRT/GjPnRRSfZMGPZiDvpw8
         U/Wd/fKmXA/ZIIRZo5jqI/HHoLPgm39BnpC2Mp3x97lAoAB6Knbu0FxmWmlDrtgNqdP3
         FPWA==
X-Forwarded-Encrypted: i=1; AFNElJ+c2eQmTmQ1x8abkUQqKEjox6mgkWgUNcry+JzYLS3gAoo0aI/zO2CMq6PzibryHngRcTo/ZJpQYUFUvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxsjFufVzyjYQfnXIYSJ9uozuzmMqxq3LhjAwlrlJ4Nl+AuFpWO
	quAzVksTxu5vN06D7WysWIPqUVCka1vReRIN3OMR7uI9yX52pSysb6yD
X-Gm-Gg: Acq92OF/iB5qrBRPTESDRuFFnRHRpGCbucBfN4pm1RAurEzBUznmwHnrmXE2SK17kVI
	bgOrePeb7jU/zws+mSyERTQtuQUdb8XUawPjHMzZb+VA3DPlFrG55uquZbmJ0xS9N2xODQBF/LU
	YGoT94cBI6qSVjB+T8zSQ9cy3HVIOsJa1OmgTEgOyIsOJOwlbCwYn1Kt3qqTNQR2vPplWJ0qCpW
	Bb/AOeqE0AB+29/Fx/xmVPz+bkzBQdCPq/9bu7DCJBPEU6z8DK0LOQmSdz1khwL3VZ1VkMLVO8H
	azFVeHow4NG7yv1DumeASqEOc9vQshb+zIfU2ejfkskQzfcNg7+d3U4ulcdL8e6PM7UcQbZwwcE
	JH2lPcpBdji/xnBlqCQYHsb7MZKNzwhDwMKKUltIvVXls0VALPtqdP8BX8RxvHfgXJ4FD5h2xh+
	vx6rOXsjPqJ+5q5voYpUrkmqNRZ91hj5zZGQ==
X-Received: by 2002:a17:902:e851:b0:2bf:82c:6322 with SMTP id d9443c01a7336-2c1639eded3mr14290625ad.3.1780452690145;
        Tue, 02 Jun 2026 19:11:30 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm6305885ad.11.2026.06.02.19.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 19:11:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: reduce SG2042 MSI count to 16
Date: Wed,  3 Jun 2026 10:10:49 +0800
Message-ID: <178045263171.227355.8295224665627411486.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
References: <20260407160143.1182430-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_191131_242489_971AF5D6 
X-CRM114-Status: UNSURE (   8.40  )
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

On Wed, 08 Apr 2026 00:01:43 +0800, Icenowy Zheng wrote:
> The SG2042 MSI controller has one 32-bit doorbell register, and each bit
> corresponds to an interrupt. At a glance, it seems that the MSI
> controller can support 32 interrupts; however the PCI MSI capability
> only supports 16-bit messages, which makes the high 16 interrupts
> unusable in such way.
> 
> Reduce the MSI count to 16 to prevent producing MSI message values that
> cannot fit 16-bit integers.
> 
> [...]

Applied to for-next, thanks!

[1/1] riscv: dts: sophgo: reduce SG2042 MSI count to 16
      https://github.com/sophgo/linux/commit/903a9364e40563faf4730dc63ad7446246f494ff

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

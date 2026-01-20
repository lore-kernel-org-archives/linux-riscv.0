Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460CAD2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BOa9x2zf7MEJTdESTgfV9uBl6WJcBXCWJdIVu8UNZiE=; b=AnnxUlW7pOYbHi
	K51EnqQ1lj7/TU/TDD3HcwxbgwSfurAvxScViCZ+S3Fmqu4QAVvSpqrb+643O1d0NEDk6lZCgNqS9
	P8CwSnlU5fHzdnJs5KjpwUNGJlcJKRTEiD7khL2WmqfwCVi6X6uQtCkLZ/tVFQ1lUacgBLxV+ifQ1
	oOtTVQuUOEQiRCoKI665owqvmX8xrpYfzMThlq1UXsGGQOEdI0YPSU/526joXLAzTnq/0idGr4xYB
	O2lXHnbrisz0qHEadZjYSh16fAHU+psCC1e+fjmEdOHB7+67mtchpZcc6izkTbclx8UPF5t1ogxTL
	WCEAH5yKu4FS4weJct5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3kc-00000003Cw2-2s9k;
	Tue, 20 Jan 2026 04:53:58 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3ka-00000003Cve-1Jwy
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:53:57 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-8c655e0ee70so528424785a.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 20:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768884835; x=1769489635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=aY13Qlsq4GuLij0c70xMAHAcHBDI7PvtpTRE9JthLycan+ez/Ek0nvZ7bwdZTfFmNG
         ptqZFpAQJwqymt77xlwaOTeE1oZQFgqXuaq+qAf4r/fIuYkeXtmOoxfdwEzGr9FXqF8u
         FvnC519hgVNPxKvsCPCPBhA8d0OXUiBICvdba783nxj22h4wQx+MbIvjbEtI1TVUhwv3
         LNCFFkp/GLrRZ97Cg17McrdNi5gooIylLOaRZz5lNnKnKh6t5wcCjIzS42kCWMfSL3bA
         FZsajyXtn3SpSZkZtCjsgqZKaWseB+UZ+8MvcouV9CNAK2kqrzEuld/SGW0oNEIuw7sw
         gnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768884835; x=1769489635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gv5G6VMcszifsvErGVwkIh6g0xPeD3R1+Dyj40SWmEo=;
        b=weCo434740ueTAl9xvOrRlisyuleiFcIOs3t/MJ+3TSUWha3YyeDMaHBas9Re7Pl8I
         VZFdc6GGM5l4k+0oNf+I+WhaaWihkeZKWiwsz6hGBg7RS7HYvimh4Ew8VI9Az/jmj0DO
         etnMjhlMSU4f1UY/GGEF84i+TbkAn6FViNAW1BDgSzfCMNoU70tDKMW1y2XvuPXeKmAx
         UWtuXCBfxptwA+8dow+AdS+vVTOT54Hnk0zKdOgAnmjCX2FQCeUOaMmSOhrb6343z0gT
         J07kU29GyUINuiNJO4cnznbovUgAEqQC3FbUQtHPrk59HW8armDLwiUI/VLz9Sf2jaow
         l4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXToKHjfXjfBCt221KLRyMnTLn8APOJX9gv0eJEtqtk9ePXs8yhfhnfnFc6oxpK4YhOvylANkUy2OBEvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXJM+GQs0/ZkN2jgxPEr5TwQG17T0xmY0xUPSi+1qE/6e8K14p
	fTDtRSjalVPAmIM8LjVfBvBs0uPzMBsQanlNumTREM8DK2wSV4DkdvKIeTXM5CuY
X-Gm-Gg: AY/fxX56fpQryuobS9NlliNDbBvYyTT8pOKDGJ0DH8Frd4WHZHmNGfvo2r1o2YhAX6U
	GIqh4mZEYFZ8igOg/fZC/bYXr8sTujP9HVaeHGShG/uMuu884n2hU/dtwKQ2Ict5Mcvpta+Cqbj
	H0ZwYUL1bDjALVqVQ2aaqoyIVAbthCOQtwJjfyqZ95/f2rtVPL/lxqrDPVdaodyJlUbejjXRXFm
	R0prdwlfdFU6l79MYtlybmY8iu2HzcIgrTOlKwKU4A3CQrgKtcg3j3LZqddU57RCFkshB20uUBY
	NDnKIYSg1pUo3Br/betfXwcb0oZchRldknnZFhtHJxvyYX1SRJd6JPNv4HG6U7Fg8JOawfcfiYE
	H2WqMGvorjeLJS7ZD7WHaCyyVVKfP3xLm5AfiMVb2+SsW6NWuz/GeaGPbDA5Hii1pdIDoOuWq18
	WD3JgqW19Mpw==
X-Received: by 2002:a05:7300:8189:b0:2ac:2e71:90d with SMTP id 5a478bee46e88-2b6fd5d8192mr302967eec.6.1768877334281;
        Mon, 19 Jan 2026 18:48:54 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b34c0e22sm14967921eec.6.2026.01.19.18.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 18:48:53 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
Date: Tue, 20 Jan 2026 10:48:41 +0800
Message-ID: <176887176535.427065.12899087990982068409.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113023828.790136-1-inochiama@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_205356_377343_44AEE6CE 
X-CRM114-Status: UNSURE (   8.69  )
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
Message-ID: <20260120024841.dvgG_F2_QxKDo2Qi919JNGhcbzrvrN3PdtORRjAPaNg@z>

On Tue, 13 Jan 2026 10:38:26 +0800, Inochi Amaoto wrote:
> As we have a separate CPU dtsi file, move the PLIC and CLINT
> node to the CPU dtsi file. This will make the sg2042.dtsi force
> peripheral devices, and make the CPU dtsi force CPU related
> devices.
> 
> 

Applied to dt/riscv, thanks!

[1/2] riscv: dts: sophgo: Move PLIC and CLINT node into CPU dtsi
      https://github.com/sophgo/linux/commit/5e6836e735f9c9c5e8e1d1dce02dfed5fe566e8f
[2/2] riscv: dts: sophgo: fix the node order of SG2042 peripheral
      https://github.com/sophgo/linux/commit/ebb87dd74c34a76e1e93041e9329cf9269be35ed

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

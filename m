Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6828C71131
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 15:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tg+OBrZ/1x3sxSW6DF9Z+qUwBlA359BTecRUNaSWAME=; b=KQn/6k8BeNeWBv
	gARZSscmgvSgIi+LL/873NFqDNjo6+1vHOD6KJbqPBEhzaqDg2zjobRACGHzJWstTrrB50msvyxjX
	QSpBmLX/v218ETsGs4/zP+2ooUXR3fLtI50HBCOLZKFpVdB5RIW7kZH34IKIQI4WJK/hD4NrY4D4k
	K+7G1Q1HD3UrnTeNfZYd5jQm2qlV9ACLskVS6y1vMFq2KImuvhRzPt8omJQm/Z0RNahmRHLYBMwe6
	Tcifnby6ARef+8VspAfVMnFgWDa2DT2gyBEuB8yOejJyfS3s9ApH/Hwmi8+HQPMsdMiAUsTdUfvV/
	Xj9MYSqAeEMZkTLlPw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0pT-00000007IIi-1Tra;
	Tue, 10 Jun 2025 15:23:59 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOx2n-00000006dhW-42Np
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 11:21:31 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso53746556d6.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 04:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749554489; x=1750159289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=szmKV8/hLRD/BfhCLVO1JNR0megTPDNxGFTPqcHtGK4=;
        b=BL2u3U3hMj3hxr91qFTB2UwlpIp/LEgA+/ADKVAOmx3G1yjsmbg8B9dBrDE0VVvRFL
         FJBngxCII2d6j+g1b/6ujlr5ky9DbpECdL0qcZKHZDQefKOLBw2mK6xme+MFMsEgHUPf
         cs0A8zjwin2V1DxLmiotAAlBvIWQUtLPypLCqve92eE6NXrXCCFj/bS84flRfl6V6SbL
         LJbi+uvN7SK2nXEnJyNufALY0YYrk3JPqKNrQEJGTlVnbQAF0j59WKuxKLFWAnX+W+Z2
         stSC7Had66QkxlPt/kw5dwwh8TVzGc9dUqq5z1m/Zuibnbgbee5BTn9p1bF5JDWRm9gR
         pvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749554489; x=1750159289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szmKV8/hLRD/BfhCLVO1JNR0megTPDNxGFTPqcHtGK4=;
        b=iIleNO/qBUjoRiIU37EdzA9WfY/wrAAmnLZHeTGOk1tNw2QjoIV8nL8hTFMN3t18GJ
         94QeMby8TK4S9ic8vaT5BZ/vGpBC6/NFC7mss6/Fk4YpUOyJzUlk/zJnN8i5EuDJmhe9
         LN2JVaB1kObBLHa4qIzRTmZYr0G+4lmUPog1Ct7LD8Sn3jp21VjtZgDbgER9Y2s7Po7I
         /h1r+NuU1lNj3mUig5EkmDlFKQOR5fTb+rVxNeEVDwj4Bp4525iKsGekxh/y9A72OZaP
         aoJ459ulCwOEe2PJvYchHXcx4rEBsgGVN4QNFkN8KPp/UrVaD0xSBvI6leUYW1BlrZBv
         a0bQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0WZtadLUZ3Kep8lxnLxCIiI+JU4gWJuJhftY2EsPZ4tfBQizYnJ/K3Fcyn/vmytealReHARNKg+Vu1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZd693fJN8le1WV5+7qpNI8VfW9JvfFRMOeZbUvhXHHaaNNNt3
	caRsAfGmqHZrjf/ziECiZwm6CZx95NCf8ZcAiwgJU9eQWxXpJsJ8qFsw
X-Gm-Gg: ASbGncuIkhERifCNEKFxPJMV3wpAD678Q1PROosgFjtsPf/OGLAIskgEh6KrzJoCej8
	HAXgKXgZQs2k9ut2RHlSM6Mgsyefu99nZe/Dxcujg0FJksIdqA9ge9wHJ+1pJZRqb/A86sDqdNf
	jzR3xQ/klliTZbzBvKjhNFmvH5DsEoO1glwiJSr8kCPaaAcy4AoBWRUtKyGEVAnuUHyirtukR/f
	PGseOYBsjpMOFGW6KvpNjlguAY3RCPaHL0GOqY0QPgH6U7t746FRRIRIhEdAZBpNYdznpMrFb/I
	2RvFN+UWPMbxVYO08ERPcpOjiJcEzVk5W5/qMg==
X-Google-Smtp-Source: AGHT+IFY5rvDpdmdyeaeDG/4L19R5LPs+YWIFLKwWB5tjYm4meLynLzPKZHGYa0vfPuvDWlt/nZlZg==
X-Received: by 2002:ad4:5f4e:0:b0:6f9:201a:c05d with SMTP id 6a1803df08f44-6fb24cabc19mr37122406d6.33.1749554488907;
        Tue, 10 Jun 2025 04:21:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b1cb6fsm64260546d6.79.2025.06.10.04.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:21:28 -0700 (PDT)
Date: Tue, 10 Jun 2025 19:20:21 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Message-ID: <qsxwdfgrn2wsho3cgqbkfrmzngwbnt3mymem5rf23xpu7s44mm@mc7bzri26sfn>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
 <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
 <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
 <AS2PR09MB62968E478451D6D4480A8FCE946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AS2PR09MB62968E478451D6D4480A8FCE946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_042129_999486_C2604D2F 
X-CRM114-Status: GOOD (  15.45  )
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

On Tue, Jun 10, 2025 at 11:09:26AM +0000, Vladimir Kondratiev wrote:
> >I think all should be removed and it is OK to use old >THEAD_C900_ACLINT_SSWI
> >as driver config. At least for now, I see no similar case about using defined.
> >Maybe the subsystem maintainer can give some more meaningful advice.
> 
> OK, I see. Then, in the Kconfig for THEAD_C900_ACLINT_SSWI say it
> selects both THEAD and MIPS variants? I am a bit not comfortable
> keeping THEAD specific option for non-THEAD stuff. Here it is indeed
> good to see what subsystem maintainer will say. If I remove logic added to
> the Kconfig, maybe I need to rename a single config option to just
> ACLINT_SSWI and list supported variants in help text? If going this way, your
> input is important.
> 

IIRC, I was asked to use vendor specific prefix for a vendor driver. I
am not sure how it can be changed when another vendor comes, so let's
wait and see whether there is some advice to improve this.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

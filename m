Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDF0C4828F
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 23:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Pzzlh2rEMxFxVEfvL74AHHwc8Dl2JbZ5o94TaWUOXM=; b=yvhOWu1vHoZNAX
	0y59FM+8PHiGNN02m/3lfAHbPZUlWYXTFMgggB4xv5O8k8pS5WYVq08S7EroFKgxoI2qx/PkWqGSL
	SOJZ/g2J7xnwMUw9uRLh2Kg6tsd5kTrpI/HX4sGI8+SsIt1NVpekbJmt5Ahaz8f6uIobNXokHRTEJ
	nOB8hhFJwiO7nKSSlRw0odDwPfJA5VDxcPuy0u4p+JvY0TR5TRzmAtPqo7MpVdfUmz/G5UNtkKFxK
	R1Z+oAfK5lqkslnNzqA7hoy3YCJaBqTaCXNxWL+p3FgusvmCcAqC3xVAZ62nsT+MGDq0NsGitFOZr
	hfCw0rMvfj213zasjk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2hF-0000000DlDr-3eXF;
	Fri, 02 Feb 2024 23:11:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW2hD-0000000DlCb-1kx5
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 23:11:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d953fa3286so17489585ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 15:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706915500; x=1707520300; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHdbZrsZTokHWKJxVwD4JX+ciHNdzB1lIA6SnmSwlew=;
        b=nJF8bjvNF5b8+LrfNO5dUt5d4G8YqyKDYI0p3TtOp6zqniVSmRwN4C4lRlRm1D/L1p
         ff947aY+aHrm6G/eZ3WAMRblEwloKOWKg2p5egqyzyHK1MGA4JH2axpDWA6P3Z3oJQT9
         WQPYUYqgKRJNMhjCy0oCyDxv8dezCwqhVOWLgJzNziOIMaNVYvGUk0XvLRq39vG+GJm1
         S1r6fIRhDWl2kWHs8zdejZ3akwNzRRYrha3ButSs5rfHR5Bf5jTzbV0jAH+I2hxSBOiM
         UV2Z49WunFc7W3p3Md5SeE+k40qlhV44nmpsWUBzsX8WPbdrjONoXrYMnX8qCkkOb57R
         WJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706915500; x=1707520300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHdbZrsZTokHWKJxVwD4JX+ciHNdzB1lIA6SnmSwlew=;
        b=RCmiNYt/8Tnn4VBjzkVkN4F82H7XbtMy+7QPRgL7eOSs8cFOxgbBBug672uIaQnbeJ
         yRj7Jj9bg1K/VqgBKwhwAnOAw7q8TPF9B1o+bji48Qzyb13Z0hmdozIiS+Le5ymBumGd
         AOGXPvkMjB+WPLEulx0niiybsFtMU9y74hEMHpCympjVHPIOejXJokYw+AtJY1q/sIhj
         MyJDC7TCndzCiKNBBAp4Prrzwq6Ss07seH1xoFVhkg1HwE8F0bBczzSt5X8NBg8X11rT
         HxgbgjPlHIsdE2NQ3HxIH8qpudZvPEblCMih3sjYS+n2t75rJOwP2kt9V35zZ7YJ3qzj
         nsHA==
X-Gm-Message-State: AOJu0YxsRYlRl1HVoYZIqnaibsy/uo0BpibyOsjzo/hz/ItR2EbSQoXw
	ciKOdsPVJR7sV647O73zlKVJkPeMGpllYuTNWyeMW7Qfj8siPFt4SEyQWYtz1i4=
X-Google-Smtp-Source: AGHT+IFX/dKWJI8yIfAkoJs/rbb0rLuwba0Hcyv18OQjxuVcefT2YVIE+bGcOXuXhBT1os44X8Mj0w==
X-Received: by 2002:a17:902:f54d:b0:1d9:5763:d8a6 with SMTP id h13-20020a170902f54d00b001d95763d8a6mr7579957plf.45.1706915500419;
        Fri, 02 Feb 2024 15:11:40 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVIHyNlDOkD99rLrYRzWLRSHV5hpxyrtDiy3TGuaRaA4IJl6nfV3qkQY3G+zDr7nYVRuTzMLvnnQYQEfyHJ6M6DT/8EXFGJ/DI33Th9ol6wEmsfA8wqnd9+d2c1O512DzEO+DkHNCyDLVkpVfEiiYC7U3WLy6YuXi40bJ9QvZe0r2rhQSVCGE+uAmoQN6B7ObAmaBO0sFHyX008gH2VSXxt4vjgoPor72q4fIr3VJK2MMYN33N728QsbGOI6UnU7LuJ067inID33IDNC/wIBL4nEXBPwQ==
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id h21-20020a170902f7d500b001d987771270sm324998plw.125.2024.02.02.15.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 15:11:40 -0800 (PST)
Date: Fri, 2 Feb 2024 15:11:37 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: lib: Introduce has_fast_misaligned_access
 function
Message-ID: <Zb12qZ8cpv/O3s+4@ghost>
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
 <20240201-disable_misaligned_probe_config-v2-1-77c368bed7b2@rivosinc.com>
 <20240202224939.GA2055@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202224939.GA2055@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_151143_600820_24C7BCF7 
X-CRM114-Status: UNSURE (   9.83  )
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

On Fri, Feb 02, 2024 at 02:49:39PM -0800, Eric Biggers wrote:
> On Thu, Feb 01, 2024 at 03:30:45PM -0800, Charlie Jenkins wrote:
> > -	if (((unsigned long)buff & OFFSET_MASK) == 0)
> > +	if (has_fast_misaligned_accesses() || (((unsigned long)buff & OFFSET_MASK) == 0b101))
> >  		return do_csum_no_alignment(buff, len);
> 
> Why did the 0 change into 0b101?
> 
> - Eric

Whoops, thank you.

- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

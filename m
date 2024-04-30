Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990D7C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 10:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCzgK2kjxlMxW9YB7WhNuZX7xOYZ1qIbczo6+SSiqJQ=; b=fcRvqyvBowcoZw
	kUop8TebaOvpF+uugJnaBVSbI247oPIqd+6gLta8sx7EHnPMi+Tu60208Rh6xgrazgeol/lFdknPS
	/fO8Vnwc4QrezEHtoW9hdZJRGpvce1AF9QDZ6cDHLd1FebvIfc2U3AiY3dDB8fH5M03j2Ylp1bPt3
	cniHZv8ENeaDWycpvofhP5LWwPAq9o90KsN5bOaJYaxhyzKHQeuCQg1iMh9TxS4mxyJnVRk4uPzbe
	9xwHURcTKTSJCbnbH/NNY7AZbKxjv4o90/WhayEDW8lQBMKQyjdlROi6Z7y2bPw5ivNRQPxQcqtBu
	kdphpU/HmXx2YeuL3DEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kOd-00000005wkc-1REo;
	Tue, 30 Apr 2024 10:07:35 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1kOZ-00000005wjy-26fi
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 10:07:33 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-572a06e47a7so266667a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 03:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714471648; x=1715076448; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X2r6vFxOsrH1SI0fFJepI48sxB8CrSsgq16crhknR74=;
        b=U7DsY5/bR0HMUjq/0+ammAjNnHDIQPfELyhsOBuaKaNF+NGDxnQSU/HMKTgBzZFs57
         Sxk4SVXRbzeDUicO77MY7p46YJUjTexBb5Vcj/gmy7d2t9yixPztwDNg+orbxpIyhcJa
         7IhPyGMEF1TcC0cnuKHp+kgm/GxtimlRhDGLDw4NELEF4jPjyPZF9BRlHRYm5wgFJtXT
         3jZ1zxSUGPTBesN0GvCBX9fWaHLnpNqcuaj+ZZlKNT1AFrcEIqFg2noF76zS/sVy0gE8
         ELDh5lXRyu5/luDp5WWzEbwmz7D9JT2yaQ22QmCbHfTVv+1Bmc8UixVtvA/Eb2uyjbxd
         4toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471648; x=1715076448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2r6vFxOsrH1SI0fFJepI48sxB8CrSsgq16crhknR74=;
        b=D3Mkqfp0dN8fneOA8Jym3vMcWMOYmUHhkDWPNwJlWEcGstDEHjWYv/9ta4hte5g7e8
         HL/CXn0BzYzrm3kOU1hcGXglY2rDyH1zC0w9h8XJcsuvW/m3tuMeNxsBibhm2xsMQ7D2
         fpBjBtBD8KNXClWkVqdY08bcs8mVGpOzmhOb+nWs/aJqlFrgblNQWMdX/a3GS3m3Iz69
         DkBMB7RalalWjc7U0b1/XjbrEJAf6XLCf58BX4zMtRsFi5DWS3aHggD/JEWWXT5sXqaM
         hpl0JUCYVmDqAFqXTxgPd5yLbNId6oKuuvEo6C7aC0X4hHpqJgws6Xow29SgzgcCBLkv
         +2Rg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ou5ogCF/JWOqc6K65Q1hALp2YAfLuFSvQrtaIp6HDnRlSaiGzC8O8lR1KIgIj47kvhbNOTaLN1mC4jU87tPtBOKsC5tA9oDuJvFWKVZW
X-Gm-Message-State: AOJu0YxsyYkn+HXSjBBimw8rRN8UTMM9MEshvQvpFlWv7toT/DidFzPU
	WaRovNqrwCJIbDCw5pJdQ3/IILGSVpj3ZG3LKi8+mytMg7dqY1jjHAYfXmJgBhU=
X-Google-Smtp-Source: AGHT+IHR+yWfIkq8eqNqKOZTDszbKiLaNlUcUX8HdX0mL0Ur+qB1bBfC1nK9CY2nqr33YiCTWvl8sg==
X-Received: by 2002:a17:906:81d5:b0:a58:871f:8eb0 with SMTP id e21-20020a17090681d500b00a58871f8eb0mr9371487ejx.7.1714471648237;
        Tue, 30 Apr 2024 03:07:28 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a14-20020a1709065f8e00b00a559bbe8a00sm12131014eju.100.2024.04.30.03.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:07:27 -0700 (PDT)
Date: Tue, 30 Apr 2024 12:07:26 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] riscv: cpufeature: Fix thead vector hwcap removal
Message-ID: <20240430-6781cbaa0a929246cb77dafd@orel>
References: <20240429-cpufeature_fixes-v3-0-6aa11dde513b@rivosinc.com>
 <20240429-cpufeature_fixes-v3-1-6aa11dde513b@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240429-cpufeature_fixes-v3-1-6aa11dde513b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_030731_575108_413CC41E 
X-CRM114-Status: GOOD (  13.14  )
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

On Mon, Apr 29, 2024 at 03:29:51PM GMT, Charlie Jenkins wrote:
...
> +		 *
> +		 * Disable vector if the boot hart has a T-Head mvendorid and an marchid of 0.

I probably would have added the 'why' to this comment, i.e. T-Head doesn't
have standard V so things will break if we try to use it, or whatever. The
'what' alone is just putting the easy to read condition below into
English, making it an unnecessary comment.

Thanks,
drew

>  		 */
> -		if (acpi_disabled && riscv_cached_mvendorid(cpu) == THEAD_VENDOR_ID &&
> -		    riscv_cached_marchid(cpu) == 0x0) {
> +		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0) {
>  			this_hwcap &= ~isa2hwcap[RISCV_ISA_EXT_v];
>  			clear_bit(RISCV_ISA_EXT_v, isainfo->isa);
>  		}
> 
> -- 
> 2.44.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

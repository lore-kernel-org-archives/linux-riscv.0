Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507CDC77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 04:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+woJtBwYZFxAp2zzbgSHjDH6A8vQawaebwD4eGR6iI=; b=MHUzqcE65bSCGj
	HusswK366jiS58RkQ/2rc0OilG0qM9XJgO7qM/7IS3PEV97UbHlyKoch1vI2+SgIW51SX3vvMKmWG
	UhVD364HGjuJWcMR+Ws26JGG8bBybcNr+ymL+OIsWXDczA8LcQb/awkQ9fJBPZM4+9qVBzYGXCecT
	1QD+CXULUAWEzyN+csW4pcMqMwKzVq5qJgK6wxF4KGZ3Yhr3AH8m8FBXXMNJyzsqBM4N6b8hQiODj
	nPfNGrHsBtfWgGqL5sXmQ4m4XUm8l95hZfXEe0LekjRuSJDSTdUaGHmPakHIoaIisfEZIX/rRFgPC
	h7NG2S99NpgxVX87EPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pthoh-0006mk-1A;
	Tue, 02 May 2023 04:40:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pthof-0006mQ-2x
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 May 2023 04:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7mVH6+bWUcuKUF/qKwIgPR0gD6lIVpcYINT4JISpC94=; b=HldKDviGOFByXybLNIFka40FL5
	jNJCD6ffaev00ej3tl/7XeTeQzrtI80qpGsdFo2JlK4yIree22SzzQvxmjSXJAEocolD/Ke2+CsSJ
	UG++1uIJNS7nFlzyGTQBlRwcfqSJk8pEzwJHcVPvrArjGjlHTQcQcLx7dnFmTwt4dfEKAG5suS2H8
	g/i9dLv+GhSSHBRynsQSHQz09ocg+nMLnh5uhkfzM7RqKpGXLsngdynMgDJGua2rrv/vsSvLA+L+3
	VB38StPTcp/wnFTehHcaWrTO59+FR2gxhSpJiQy5rFdg60VZnszsTQPfDFkGDfqb4Taz0lViBTQcr
	K66/n8yg==;
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pteoh-00F5QU-1o
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 01:28:37 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-1924a23ddb7so11644410fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 18:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682990905; x=1685582905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mVH6+bWUcuKUF/qKwIgPR0gD6lIVpcYINT4JISpC94=;
        b=P9fppIss2OxfjULIXvdy+dUX9w7PEVRop13j86caNUW0bBs6C3/wQSOOYO3cSMJtjc
         ihPHtbEIVh4by3RpqOVqh6TeH5TRE4WC6Co4o4k3dMbyB0lgaMEEGof1fwKOkTEK1glf
         AuFI2se8mKywLPekgTqxP320UZ0MMV0U29UiLdWUptUQubbBRYA1uinapXGRIR2IvQiD
         7lNS1CY5aalCpYBAShhxplpZZSpD2DKbUWgbHpZEn8cVN9e8x5T4y2vxao2EkDWbh7pS
         G4QZTcE6knoEB0E870EGK119fD4LHTea7plc+p6aDdf+8XHQSeTfxb3VXfJShGGoXlmp
         iT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682990905; x=1685582905;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mVH6+bWUcuKUF/qKwIgPR0gD6lIVpcYINT4JISpC94=;
        b=IPq47Vii2GgIuZgwS7voPJzxI35extRQAebwK1jPoO6SuN9piLqga/B7+woTkpzYNw
         TcNOIRcglwmBMWli0ejH4A6TRbOkKjehloBiqewFILXRsvScB+X6ed4ba6VR5dgMXYyl
         9k5KJR2M55QAfjvb9FZhd3S1iB8XQJBQjir90vZ4LL80wpzHMokUNsxQLJFtgz/4ZXm3
         SoDnqqIiMhknbZYmxJRjBY72F1EnKUIsV50TzhHyOn7wn716Jj5RzBEWqmYjfO3eGfSq
         clEZB+5Utn1ZFJHE0srnS3ABZWl2d1cSy1iJKGp1mAKHyF5QpRA6VyTizHWAhzprmjx8
         iC0A==
X-Gm-Message-State: AC+VfDxwk7oIaahfBpQJzA8q3tsQ/YdFJw54gFz0OwgftAPSeWuBNy77
	Yh4jIRh9YSVcHUJNLkXa7RY9rg==
X-Google-Smtp-Source: ACHHUZ6GSw2x3VDmZQX5TJwpmEs67OpnyMp9mprjr4us96mcsrPP3CnY/k1sZeNeHVZjlquWpmBpGQ==
X-Received: by 2002:a05:6808:8f1:b0:38e:467f:fee3 with SMTP id d17-20020a05680808f100b0038e467ffee3mr6754306oic.29.1682990904854;
        Mon, 01 May 2023 18:28:24 -0700 (PDT)
Received: from sunil-laptop ([2409:4071:6e87:a073:45c:9455:55ad:4703])
        by smtp.gmail.com with ESMTPSA id p203-20020acaf1d4000000b0038cabfcb3ccsm12099517oih.15.2023.05.01.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 18:28:24 -0700 (PDT)
Date: Tue, 2 May 2023 06:58:07 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <ZFBnJ/7TWTBpPZm0@sunil-laptop>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-14-sunilvl@ventanamicro.com>
 <20230429-voucher-tutor-715fd4f6c24e@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230429-voucher-tutor-715fd4f6c24e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_022834_567557_819EAD21 
X-CRM114-Status: GOOD (  15.40  )
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

On Sat, Apr 29, 2023 at 11:31:20AM +0100, Conor Dooley wrote:
> Hey Sunil,
> 
> On Tue, Apr 04, 2023 at 11:50:27PM +0530, Sunil V L wrote:
> 
> > @@ -103,14 +109,36 @@ void __init riscv_fill_hwcap(void)
> >  
> >  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> >  
> > -	for_each_of_cpu_node(node) {
> > +	if (!acpi_disabled) {
> > +		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
> > +		if (ACPI_FAILURE(status))
> > +			return;
> > +	}
> > +
> > +	for_each_possible_cpu(cpu) {
> >  		unsigned long this_hwcap = 0;
> >  		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> >  		const char *temp;
> >  
> > -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> > -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > -			continue;
> > +		if (acpi_disabled) {
> > +			node = of_cpu_device_node_get(cpu);
> > +			if (node) {
> > +				rc = of_property_read_string(node, "riscv,isa", &isa);
> > +				of_node_put(node);
> > +				if (rc) {
> > +					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > +					continue;
> > +				}
> > +			} else {
> > +				pr_warn("Unable to find cpu node\n");
> > +				continue;
> 
> I was poking at this the last few days and went back to look at the ACPI
> code again. Is there a reason we don't do early-return here? IOW:
> 
> 	node = of_cpu_device_node_get(cpu);
> 	if (!node) {
> 		pr_warn()
> 		continue;
> 	}
> 
> 	rc = of_property_read_string(node, "riscv,isa", &isa);
> 	of_node_put(node);
> 	if (rc) {
> 		pr_warn();
> 		continue;
> 	}
> 
This looks better. Will update when I send the next revision of the
series. Thank you!, Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B85C7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 15:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brVqG42LZZJu7jUVT8u7XrAWx1oOmDkdxKSUZXsm61M=; b=i85ad0JbI4lx5T
	OZc/g5KTOQcEjSvq9BZVa+RPxvBv+x0Vvx7DlT4g98oEHdAN2vwZaM8NYzOJe3wEQ5H5ZUimGqnpj
	GRYd5vqX8o2gzAEworey2eNqHHM7WM0GPbY8v2mc1xHTE/f9l998Ri59au2xKKJgCGSICJDSQ70Xr
	uxjobxEoiUKenueVjUXMOAXPrdmUX0J9j8IWwK6a6ERPmOvcstDHVlJIy4YOx5CBag8yh0siqf97J
	6sxg2BCIpziXQ3nP4a4rNGnXtfmW968Pph+pHZtKcmLqEHDVyXUDnmct+IY9gpBxW56nbnLTGNUDe
	e1SO+bz2SYJSRe5ygjtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5CF-004sJA-0m;
	Wed, 05 Apr 2023 15:37:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5CC-004sGH-0I
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 15:37:14 +0000
Received: by mail-wm1-x331.google.com with SMTP id s13so21117937wmr.4
        for <linux-riscv@lists.infradead.org>; Wed, 05 Apr 2023 08:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680709022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T5c+mNA6XY8wWRzkfZN072IgeaVS0xxX0AuG9Rc8s3Y=;
        b=hxKiJK155vYGbPwdzRmDCUiWyNZbG3wukTsi0I6XWU1DKdfAnkq5nWIAm3DB4EHZU1
         hirqMIbrtM5n61hEYk2ikAcX1fckKmRWVnKXogyDi7RnUYcodZWpte/nbyhVpCDMzzXU
         /QcLUWksBNjDMT8zYtMqtFv0QPFkZiqzGEI6fjgwWIURijiUBJUIdp5eJVEqIUh6ADuU
         8qBGePxy0bgwur+kNXliiyRCD9so9ZDfN7yG+Le+ZkUPJ/iPAGYbbT7ufog5IAKFtaKE
         crVgIE49ef3OQ4wz2me77wt9zM9ZryNZw+pXCpIiFaWduEdNywug/sDDujT48AXZN0P+
         JPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5c+mNA6XY8wWRzkfZN072IgeaVS0xxX0AuG9Rc8s3Y=;
        b=QfZjq1OA/dugY7H5x/Si86ZBoSiprS0rgz7tsyBgxSkPvKSw0hq8/PdwYt8IlnovSw
         QxANsKh6G5WjG1BbxdyzE6nibpEXmTnSV9QPler24/zGbeZrfTQbpA9zHAyyEZTl0BVg
         Zxgv7ARyy/xNACz9XlD6QXyeyiIEvk1C46o/7zDfzWYAGrYqUlz+f+Iaw2OOtA3RazOi
         Q8WceDoT2+Jbv5rjZnBMedDU/vp1nyCqFUcE8Al4rU+xfbgk+JPu1XIllAe3UYGtxVT3
         TXO6rH7KFXwgFv9YahHMdPTNjzzsaCf85WU8QFR9b3uoVtC6tmdY5fwKMJ80/kL1Ypfx
         JcSw==
X-Gm-Message-State: AAQBX9d8b/FzgZ799HJWBrwbskjyLv8tJv7ll1eK/4r3b8kIpIaEXaL8
	mi6mCXQasdEtAI/4Vp8Fh+FCaQ==
X-Google-Smtp-Source: AKy350a3Rz0tEpg+tSdGOZ4GFjJ3hB0PumjkJW94dJW2rUvZU2nc+5RfxVg2opTda9VASWMRks1Myg==
X-Received: by 2002:a1c:7501:0:b0:3dc:433a:e952 with SMTP id o1-20020a1c7501000000b003dc433ae952mr4664257wmc.33.1680709022536;
        Wed, 05 Apr 2023 08:37:02 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r6-20020a05600c35c600b003ede03e4369sm2582875wmq.33.2023.04.05.08.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:37:02 -0700 (PDT)
Date: Wed, 5 Apr 2023 17:37:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH V4 13/23] RISC-V: cpufeature: Add ACPI support in
 riscv_fill_hwcap()
Message-ID: <fajw3nx5d6u32qvsb2uaysayiadqf5eelfjxc4lokjcrsvddad@cfyp2gwviocd>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-14-sunilvl@ventanamicro.com>
 <20230404-promotion-scarce-7c69ff7e5f99@spud>
 <ZC15LqYqLzmiVdcr@sunil-laptop>
 <20230405-compel-slinky-2fe11b4bf0b3@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405-compel-slinky-2fe11b4bf0b3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_083712_126274_D971966D 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, linux-doc@vger.kernel.org, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-riscv@lists.infradead.org, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 05, 2023 at 03:31:24PM +0100, Conor Dooley wrote:
> On Wed, Apr 05, 2023 at 07:05:42PM +0530, Sunil V L wrote:
> > On Tue, Apr 04, 2023 at 09:57:19PM +0100, Conor Dooley wrote:
> > > On Tue, Apr 04, 2023 at 11:50:27PM +0530, Sunil V L wrote:
...
> > > > -		if (of_property_read_string(node, "riscv,isa", &isa)) {
> > > > -			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
> > > > -			continue;
> > > > +		if (acpi_disabled) {
> > > > +			node = of_cpu_device_node_get(cpu);
> > > > +			if (node) {
> > > > +				rc = of_property_read_string(node, "riscv,isa", &isa);
> > > 
> > > Hmm, after digging in the previous patch, I think this is actually not
> > > possible to fail? We already validated it when setting up the mask of
> > > possible cpus, but I think leaving the error handling here makes things
> > > a lot more obvious.
> > > 
> > Yeah, do you prefer to merge these patches again since only in this
> > patch, we change the loop to for_each_possible_cpu() from
> > for_each_of_cpu_node() which actually makes riscv_of_processor_hartid()
> > not useful?
> 
> Yah, all 3 of us mistakenly thought that that was an unrelated cleanup
> on the last revision, but clearly it is not.
> Squash it back IMO, sorry for my part in the extra work generated.

Yup, please squash back in. Sorry about that, Sunil!

drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

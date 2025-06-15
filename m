Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BCBC7114A
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jun 2025 01:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPjvVcmQRrtUsZHjs35sFHJoBVKwdLg+oj4o3V7fkLs=; b=Kw077qlH5oPl8v
	NpPXcYubmX7U+eZVsKydFWkEh9X/dbvD5nvRPD3n1sRZKvwPv4kitSLK2CDLrzVZBmBw1mrnliH0U
	9Q+5mwP3XNXSps9kQc7WaPBk+0RRj73ebhOEVFTMgNpzrM8Y1Z7hPf8YxjVI6AAy3IJNze66r6XKu
	smxvABx0fZzwemHqWW/cd/F6kFrFKTwIF25fK402A8wbMOU95ECh4GzOdZnBzz2Z8OaMLa2iBa1/4
	JKCevoeQ4xzrYjcgbau9NGTu3c2AqPA4Tk6halvSEafuNDZR6qmaT4LvEMWONqAyaB9SjIu7Y6eIe
	JKYYtL4dMoiOxsgaPs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQcMm-000000026fu-0PxH;
	Sun, 15 Jun 2025 01:41:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQcMi-000000026fD-47v5;
	Sun, 15 Jun 2025 01:40:58 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-747abb3cd0bso3251452b3a.1;
        Sat, 14 Jun 2025 18:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749951656; x=1750556456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NBTMddD1EgJ5XqpJb4wGCf6dCboYJMy04qeMI4QwNwY=;
        b=N5bWOAn5Hz2inuIdqYkaiZOftxrktJYTSVH+5NRci23qrYXlp5cAsNFRHRKYrb9HBk
         VBg9gVLyifl+4BdV8Kr5+wvXRwtCD8AEVRyDUKvEX6gSV9M+fZsxRr9uollaMVJay4Vu
         NlbefLKo2ZqTTwN2iJiTYiMyqSz+8tj/XL6TIdZlaYLNn4tFFOyKmUK+/oGlbnFCT20x
         VzvaZ+p6meJdDvD4EcYWRILu6C+lALo0qkmrSWWCPd24K7CNYKXZv+FcC82pWMi/4CBA
         nEpffSjfvNHJtz41hZ+O1aSz+Zz5uAgS6c41hhuCxXkl+VG0Jd2hoNS3wkBoIqljhKGW
         43mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749951656; x=1750556456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBTMddD1EgJ5XqpJb4wGCf6dCboYJMy04qeMI4QwNwY=;
        b=drhpmnQUMClItz/sWBQrmPIkjHcnwh6sfqFQKFFS1LwAnz06QESyXknX3vhq8c4bs8
         N8JlYblEcOiWSfDFvxvvXxmO5cWNaQ+G+VPJ8iEx7BRWUOHuKP+7uJ7SWXCxxSNz+R7s
         PJDzY2kQm7lSE8ygdHxAARrSeteENxpSFWXRLiTELO2IHgvZ1dPK0GKo+GEsIrtadhTt
         rBTz9WxYA9vIoC4k91E1gbvwcjFE2aQTzQK5Pby1rBvjjLCnj3lkBPqH++CNa3rOCuDs
         4MTOYCW8FIle0dbFqVzhIwhtAEfZjruL52T74bH0Ri1z2/PHdPWOTcWiaDmSe9ny3wgD
         seRA==
X-Forwarded-Encrypted: i=1; AJvYcCVDn0KFnBiVDfpYzxOMULGV7a7Wh0Ysqb2FCIXvLGgx+WHfa8AWWzCD50Bnxi4tLqs691OjtDd/BzE=@lists.infradead.org, AJvYcCXVzlAVKy0v3wUlaOk9EJgve8xKaYGgrO11CSjHttukKbY6fy3XNJE5GF3Irzi6jUw/TwjHyE8OX3PdcqM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu6Z/Uxf1MjDUF4q+DbnHdMlSKMq4OmvpfA7DbRIFNdy/t1m48
	Vd/MOEHb5bZfoPzdQU76FqopfnEC3rUp2HwjsVrlweBiHds5AcS1d8uk
X-Gm-Gg: ASbGnct9Jb4eKDAJskAKJ1jUTk4ZZ1nkT0BXT6CfLdm6f8xBignfL+fQ7FxNzJcmIi3
	6zvE2gqklqkGYDigYy7VGCf50vPas352eDw2z3TJ8rI2A0Ld18LLzEKndJ9r+q1gsvzIh4L4seL
	7yHKsipcIBCBzOAnSe+z1+RWHjmKP7rve6lbFtETpH3HxBf79kNUx2s/cfkJdWxWsVOTw9MKl5g
	qTc67t/uooz8sKgA7qfnM3Y0JBv+uSj8eaxMro4yFZr2Bok9D/rIgCDPH9IhgdSU4sQyNUe5+M4
	uQNMd0odxnpM37rbOy6AC95IAJWDnhemNnIPyRfo++eB89+iG8xJr+44v2BFiw==
X-Google-Smtp-Source: AGHT+IFFtgSTT239FlySASeK/tmHjPqITYuVff3RfVuRfyAgy5DMcBJfIvR7fWesb8KRVOi1bJOajw==
X-Received: by 2002:a05:6a21:9ccb:b0:21f:52ed:23cc with SMTP id adf61e73a8af0-21fbc7aab9fmr5594335637.15.1749951655619;
        Sat, 14 Jun 2025 18:40:55 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7488ffeca93sm4005306b3a.20.2025.06.14.18.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 18:40:55 -0700 (PDT)
Date: Sun, 15 Jun 2025 09:39:42 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Add Sophgo CV1800 USB phy
Message-ID: <rsem5lx74zhfqmb3adljeesyhqtwf36asacle3jyo5kls4aadt@qmnve7qvctq7>
References: <20250611081804.1196397-1-inochiama@gmail.com>
 <20250611081804.1196397-2-inochiama@gmail.com>
 <20250612-siesta-verbalize-6a7768ebc648@spud>
 <jf76ak6b5edgqhx4rkhcsfpmcpkrxci7rq373ld2apue67q7hh@3fb346tgaxcq>
 <20250613-deflation-aerosol-fed1d566fd0b@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613-deflation-aerosol-fed1d566fd0b@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_184057_025662_DAB5C96B 
X-CRM114-Status: GOOD (  21.99  )
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

On Fri, Jun 13, 2025 at 03:29:44PM +0100, Conor Dooley wrote:
> On Fri, Jun 13, 2025 at 06:02:27AM +0800, Inochi Amaoto wrote:
> > On Thu, Jun 12, 2025 at 05:07:37PM +0100, Conor Dooley wrote:
> > > On Wed, Jun 11, 2025 at 04:18:02PM +0800, Inochi Amaoto wrote:
> > > > The USB phy of Sophgo CV18XX series SoC needs to sense a pin called
> > > > "VBUS_DET" to get the right operation mode. If this pin is not
> > > > connected, it only supports setting the mode manually.
> > > > 
> > > > Add USB phy bindings for Sophgo CV18XX/SG200X series SoC.
> > > > 
> > > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > 
> > > I'm having a bit of trouble finding the v3 etc, could you provide a
> > > link?
> > > I think what is here is sane, but I want to make sure that review
> > > comments on previous versions have been addressed. "dfn:" searches for
> > > both driver and binding filenames turned up nothing.
> > > 
> > 
> > The v3 is
> > https://lore.kernel.org/all/IA1PR20MB4953C1876484E149AA390DD5BB1D2@IA1PR20MB4953.namprd20.prod.outlook.com/
> > It is a long time ago when sending these patch.
> 
> Thanks. I think this patch looks okay, but probably worth Rob or
> Krzysztof taking a look, even if you seem to have removed the props that
> were objected to.
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your tag. And I will wait to see if there is something to
discuss.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

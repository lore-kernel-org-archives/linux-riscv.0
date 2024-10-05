Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA8DCF8868
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 00:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsPYYjdYoS9AdvYaaCly+PYdO/sRcJ7ningbZGJkSn0=; b=v5Y0O1u1hNW/NJ
	mamqM1PHD1RvkhBYZ73EWNZjAc5//4FAscmlIvyFwcvF5yPEFb0LHHSUAsZ/bMLkCb3rq+18ZNk69
	Up7UHK2Q+v+ZJ7iBu/1nslIatlFd5G+2/5Zb6a0gvM1sLwt1PDc1sraU7Fnt5TIGDPiell7hFJxs3
	n5z3wCXZ9DX2mLNEu01QS3DEuJIFR6IeREFW3hBMLExUS4FwIhnFuKZjCzgm8VONKwBtrLS+qjqvT
	QAWYyC/Yg2mpMyCbELtM/dDT0RHNyYrgRR1W0EfAKYwkHsxA/c8AspRypZkOw02C2tSGV2mXWTh8U
	4E2YOKlekfnVlzy6H3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swszP-0000000EYc0-1Wce;
	Sat, 05 Oct 2024 00:49:43 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swswl-0000000EYJV-0Icx
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 00:47:01 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71b0d9535c0so1952094b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 17:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728089218; x=1728694018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ud4hrcbGKn/h1c0XGtZ8JIky1UZlfWSJvz4r2INa6xI=;
        b=HcgOdlCdeCCMpnoJ2Ak45Wy7eR4H7T+fJ67Q/8DJder/bypWSVFJpigsDckTRxRZ6R
         yZD5NNAWjyVWs5O1JZMKlXQQ7S0srsR9zjBc/0fswR0A/08PWJQNf0VgHpbaAZQj+xtw
         WMVy1QJn6fxJj3Yqn5vvqD0iTeEWR5DcpVpsGTxRY0uc4n3uyGfaausumoYgYrptTJ+M
         Y5vfu87aJXJvsUgDiNqefyQ4PXmL+drZ2ajofCjiLJeST6QoqvrMxNmJNRQPK/UvFzSS
         pXvKhPrhSf25ZrB56ZaCfExG/Gxg+pax/+W0LvuvMBWO0b099/D3A3MGAoeEyJIXLIsS
         hs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728089218; x=1728694018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ud4hrcbGKn/h1c0XGtZ8JIky1UZlfWSJvz4r2INa6xI=;
        b=G+oq7fx+j7W4uGPupRprcffSRTJDZtgPf6vDkJ8m8vGC8xxRsPfPOyVre50mi7or16
         n9pmf3iM1lnRd60mE9546T6ekkfGnBEkV+UKGZd5mhU5/pmKzrFQg/csRpLfq2ysbmgy
         WMqUxXhpjbaHN0d+wXrceZavKefQ2LTagHx5n54vje00PrCIQPomd3KKbGi73m7CSRHq
         dBigaZPMGiEi0g0x8gjFNgBjiIdhkYdcQH1tYk1D5fGGrm0SKfJSnQpZMvfeE0A5PMvi
         ZF3CzlEQcZu0O1aDLzD/f7bP1gxPh6VXTwC7zpTM3HvaGQz2tUls/iQDll368XnCORBf
         t5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCUYdkHU5gQT74Jo20WQBRorCtFgHkGNum3+TnO1Yn2dlmQmfuDzIqwEGH7w3mNzSsJDvWMWeT4+a8VclA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysMTRYVC1ZgwBtzUi4o5/zijW2zkpj76sWqw/zyEevUQ3y11R4
	tyfLQJXkk0rFK+XQ0p0hc4OkqK3V4IVeDAgFjJ4iA9JY4XqSIfGHRLoAiA==
X-Google-Smtp-Source: AGHT+IHyITdZkA6wyOXK2hbRbUpdHaf3LcjLr9ZrEEdEgDHpLa//7ageDewJ0I3XP9i5ea9iQOaTVQ==
X-Received: by 2002:a05:6a20:c6c1:b0:1cf:3ced:bba3 with SMTP id adf61e73a8af0-1d6dfacafa0mr6432778637.36.1728089218046;
        Fri, 04 Oct 2024 17:46:58 -0700 (PDT)
Received: from inochi.infowork ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f680c727sm623464a12.2.2024.10.04.17.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 17:46:57 -0700 (PDT)
Date: Sat, 5 Oct 2024 08:46:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Peter Zijlstra <peterz@infradead.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Guo Ren <guoren@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044
 ACLINT SSWI
Message-ID: <42ndts6wuoor3tbt3uv5kuco37kc6bnnoepqtauqosw2gg2xn7@7hfdc6wgvlsm>
References: <20241004080557.2262872-1-inochiama@gmail.com>
 <20241004080557.2262872-2-inochiama@gmail.com>
 <20241004-patronize-doily-8406fa214347@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241004-patronize-doily-8406fa214347@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_174659_141470_0F004DC5 
X-CRM114-Status: GOOD (  24.41  )
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

On Fri, Oct 04, 2024 at 04:44:22PM +0100, Conor Dooley wrote:
> On Fri, Oct 04, 2024 at 04:05:55PM +0800, Inochi Amaoto wrote:
> > Sophgo SG2044 has a new version of T-HEAD C920, which implement
> > a fully featured ACLINT device. This ACLINT has an extra SSWI
> > field to support fast S-mode IPI.
> > 
> > Add necessary compatible string for the T-HEAD ACLINT sswi device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../thead,c900-aclint-sswi.yaml               | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> > new file mode 100644
> > index 000000000000..0106fbf3ea1f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
> > +
> > +maintainers:
> > +  - Inochi Amaoto <inochiama@outlook.com>
> > +
> > +description:
> > +  The SSWI device is a part of the riscv ACLINT device. It provides
> > +  supervisor-level IPI functionality for a set of HARTs on a RISC-V
> > +  platform. It provides a register to set an IPI (SETSSIP) for each
> > +  HART connected to the SSWI device.
> 
> If it is part of the aclint, why should it have a separate node, rather
> than be part of the existing aclint node as a third reg property?

For aclint, the current nodes that have documented are mswi and mtime.
Since the mtime is a M-mode time source, it is not suitable to add the
sswi reg into this device. For mswi, it is OK to add a sswi reg, but
this will cause problem while checking "interrupt-extend". Do we just
double the maxItem? Or just left it unchanged?

Another reason to add it as a separate node is that the draft says
sswi can be multiple. If we add this device by adding reg. It will be
hard if we have multiple sswi devices but one mswi device.

Regard,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

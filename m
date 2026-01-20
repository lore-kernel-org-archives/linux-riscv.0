Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD78D2ECFE
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+nCvMOwz0i5c+aBKCEW6q2fRx9F2orH8WepRoCeRrQ=; b=gWvILCFIxmRga9
	xPS2FHAVep22DLifNZtp1B9h6+MPFtIKa5N4ZeR418+vo3oI9+fwxZcoou0IHbj8S10Xa/DiA9K33
	6fDOt2wbfGsNUXyNZc/RkucvI9mLiUQ4zlm683yRyct1iLhlAqnarGr8G4L66XZbWwVjpNL7KkYy5
	hjIDXqNYWd5xPC5+nyac08LyxPgSnBCRV5Rvkss0ls+qcfCTPWZ4ktoSNSXj/nK3TWr4+uNOWyYBL
	kviV59SBdHn5N/XvRouHsUq9qDeDF9nX1yUleRLvpRVX3Y+qtM/HL7EVjJSASguoejEP5oZOKCUhe
	4ig9GiZy8NrF0OQqiEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi1vz-000000036hd-1I7F;
	Tue, 20 Jan 2026 02:57:35 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi1vp-000000036gp-0Mtx
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 02:57:34 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-50146483bf9so64500311cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 18:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768877843; x=1769482643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=i/WROhPKqnjxEkDtfoqdZYNnACXC/LUhQlilvwiEqgSS7ByDc/LaQ+vuP2CMzGcesf
         G0Z8dJToQAmBgEIYmAx9GFldkk+y3Lh30ICgGX1xJPYQTWZp7RQ3l7xfRRySBX0IN0GH
         /mk7haR72UZfD5bdCOGFiAbv/HgKPg3O2u2Ji/chZjFd4mjm9yP+XdoadFwfZtfWm30K
         cCZ2DiymbsplBcz7Yju1CmrzC0sgGiOKFKf++mRR82GNcqh8KNs0L5R2gYv2nAPbIbDs
         WttvB3tPKz78kCX7USjocU1xqYyrEx9DU2CV41Ezfuw9HE0lJ0uMCqqkqI0+mokALy06
         nxoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768877843; x=1769482643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i2Ldiltg0ilm3GITC1FlZ3jygue5ViLbnCHXlSmV/Sg=;
        b=DvnyYZ+1gPEjUrwAa57T56bc6YirKI0PLf+NtseSwMdkPxmf0YHMfXzZjbjql8O4Ho
         9Su81OCsagvboLtNzRVvRVNsXT8e4eeRr8xBTOqThwfs5XBx74AldFQ2fXn8MgwlURvb
         BQgd7mnfKw6hdEaXhohfT4XYhfEShrXDtw2xJ2E95loIaLII404WRto42WybmMiYjAmM
         16HuieQd4EoUzM7DhnvpKRmP/YjijNDIdip9V1aQz4NnPxX7oeVeAhvjTcYzjCuMe0yE
         vxMmEhVrVoeS4S4nP4m0fwBQdZOBVEZsB7yY3rVyF4uqgkfTCguAjyYzy3WD7RrVobLW
         tVxw==
X-Forwarded-Encrypted: i=1; AJvYcCXhL8SSu0I9dfQzMWiX1k2PO9SswIxhNV/ZmxRqk7KlUcRZTwr80gzXaiYSP7Fy8iThSVsQMvLvH5HSRA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq6bc1jGtzGotnDilpmje5KttGfnsPCoXq6WppzdgNm9+0dZjo
	p/zLjBJkXQCaocnB0Wl5+FgWbdDZoKwbWjPprZScW+lJauft/C3YI1lNWDZ1II/f
X-Gm-Gg: AY/fxX7OmQvR5lLdC8rVWdTssDBiUEjAdpn/qR9HL0dHaOytOkET7sy6yjT5yQt70N5
	Xz8B6HaO83VLa5J0301iOtHxzuFjIzExWqb6EDvsn6M1DlFwXW0W0k4ZlLMXC7bG9Qm8CRHv9bX
	fmKwl2G8VRlgfqjH32IpqUwJ9rlSrwhwgfYoZVpfKH/0Y0JUEA+/oBp0cx/PDb3QVrSUtcMMheC
	FZgtTAWKy4CZjsRzWENS61u50Saedss9F6h0jyGbavkalC3v6XFASovr/9FhyYqHiMIkTYfKcTZ
	10PE4R/h4J4DAsDlJzyCxlewLl59xJBhfb6GWLewroLYvQAoUY0K7CxpvucXq5jklNDU4Koa+W6
	/tW7tSHTSn7QAhT5ADrN8cZCHudz7gKGfj6o+//e5viKg8OUorFHfUs/xSUxarKDcu+aWX+UGNP
	jeCPWFmDyV1Q==
X-Received: by 2002:a05:7022:6288:b0:11b:7824:5c97 with SMTP id a92af1059eb24-1244a769feemr12788374c88.40.1768871785704;
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6fba43c3dsm747540eec.0.2026.01.19.17.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:16:25 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	spacemit@lists.linux.dev
Subject: Re: (subset) [PATCH v2 0/4] riscv: dts: Add "b" ISA extension to existing devicetrees
Date: Tue, 20 Jan 2026 09:16:14 +0800
Message-ID: <176887176536.427065.4468747981087466363.b4-ty@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
References: <20260115-adding-b-dtsi-v2-0-254dd61cf947@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_185732_602792_0E584CCC 
X-CRM114-Status: GOOD (  10.12  )
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

On Thu, 15 Jan 2026 07:18:56 +0800, Guodong Xu wrote:
> The RISC-V "b" (Bit-manipulation) extension was ratified in April 2024,
> much later than its component extensions zba/zbb/zbs (June 2021). Recent
> updates to the device tree bindings [2] enforce that when all three
> component extensions are present, "b" must also be specified. Related
> discussion can also be found in [1].
> 
> Patch 1 clarifies the ISA spec version for canonical ordering in uabi.rst.
> It is a trivial update, but can help readers reference the correct
> document version. Acked-by Paul Walmsley in v1.
> 
> [...]

Applied to dt/riscv, thanks!

[3/4] riscv: dts: sophgo: sg2044: Add "b" ISA extension
      https://github.com/sophgo/linux/commit/f16ae81b80ca4e721f4c4ed1f28390115f7721eb

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

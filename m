Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9FBCD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 07:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6valn8Qi23fqTQ3t2soXnfV7HUs1mdSLkTHV00JI+w=; b=Qw1RbMzFLzazDD
	M7uRTEqh2VTFoBF/yTwknxzxdclIaZW8zmAUgj7gXxinzhqwNL2ZnbeDUXhxwn5+cLOhIsXCXArDm
	8hsEtaU299OFukl9aNozTyv/nNflj1E+stB0nZMKsiM6iVRHw90h7KW7tgmYSySLnogtmyB6Lw8uz
	BSrjl7cEUWgozSXvbrMmd3xzbv1YQAZz/IwI8oEKAxPgaMlHIbJpeTu223TRr1FNx2Yr2UTfNYLBX
	VqtJeFoZf+wXkZuNWZUGeO4yz/vzegwlQ/Wv6WIQ0GPD7AHbxOMLrMunxzBxR8DyMd41Xdw1t5xoc
	Uji+4JY+6NBJZcvWGUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFm1-00000005rvi-12D3;
	Fri, 08 May 2026 07:37:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFly-00000005rsT-1ahm
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 May 2026 07:37:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=; b=htovb89/beZghFzf+I0DsOVMu5
	kDoYWhlQ9/khXyGTd7VxVNpjIbXfsuzwDq1TT/bLorJYiZCV7zngy5mcDZ8bwvBWf6Ndi3A01Of3D
	5T+hoIznnSyGOH4VV5lPvpN0bfR6HI58NvkB/IS2zQ2b+1iIA0gxI/e/oK9ShxA8OAqbr3d9NU7iu
	lJdrx1Z4W1jVRNkEaMfe0oGwpDVjAjwCikvPENYMkcjGiJAnt2wBYibe9ZSjvixa+GtkgldMzTosE
	KI5woFJijcmkakMZEWdM5RLqsepJ1quejX3ai37Bd7fuAGQrn9XbSE43qSGazxCiwiFsMm+sm9afT
	NiuObV1A==;
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLFlM-00000005bIj-1JxJ
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 07:37:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-67da63ae541so2839118a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 00:36:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225801; cv=none;
        d=google.com; s=arc-20240605;
        b=d6+D2OOwVRl4mTAdj6mvRS8DlgN0XGe0stALmhRd0GvP0jX3wXa7saHPSaWQRx5cgz
         ULBbbVYHwGN5CjbbYjs7nMkRj/0DqLEFL9f/QCEn3iub/vvEWsxHeHmCk6R77Sq2Oif1
         k1kbYbfmWTd3WKih5Y64N9FT3SXJTR1DC2Jqgi4o1F8IJecjgITbtdqs/1YeP6zag2Pj
         ZydlRKUj4BH3QfCLdDJ0bctUwG62BaS0wqWANt+84mTsQHfiVQclWFmZajdLRy3HDE0O
         T2uQDHVMskQQC4HvAJ9hl+uZHRkWmzPFJZPq4xq0VjCYsbUS519tgnmhEICMd46jDhUj
         dGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        fh=EwGGEquHXREf7dNcxdzbcUlhcKJ6V5cLrbUQLvx+EOI=;
        b=L/t8NmpoV12fFy6paaOJe0mh89RY4ur/D6MGd8mri461bktwUVSj/csbJMQsVdcB08
         aVNpmK00+y/rbZy0QpSZW8vJQ96EHPHLs2ZJ+PBh48j1TMRRYbpj5fKPHQya7D6IZZx7
         UzThBEFxuyOEwb475aLsA2iwzWqpFdbKx/oyWAvyV3jj3qY6Oxe+jZWaYteOiqn3DeFn
         EgwV3BkfzzgNju0ZEoEMtV5f9YueTwDU0xit9r9Qqn/l8eXvLWcHHNR/67BlmHuPmm4L
         Qsapg7E3WMNyryops9NShEc7hoXi0dvzP3Pw70RbcGX7CD7WQwH3oj9GzRL+hAfsyBSr
         sdsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225801; x=1778830601; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        b=B9dZMF1sc7IBVODgu9ao5GzECPV/GeKLpIKTUVbkNStemJqhJ/Vj1uGgDUVj94QAey
         WGJsE7jfNdh5NRc1nlH7TcSGd6n7aeJJPNJU3nNdo8ZAXfwfLaAz4UNFPsvxAEYFzsq7
         5x/CMpc1C3YdiHV2E0QjeY67jtkO/Ca0SOzVvwmhO0Gwyluls1dq1bfwmIi7rXYljwuI
         XM/zBKpToisFsBqKzdQ+x2jZf5rERhLFu8ACNihBeDISOZZ+4FpAfsSZxf3eML8HSpCZ
         4YyUtEVzOb0vshDTUSNz4GlTdCA2HsVPrQ0ismPDluUlUuVmE66fK/NVH0vw7OTEVciM
         5Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225801; x=1778830601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DT1bLE07vl0NRGAnaDV0P6+c6Y2ET3SDmigAcN1kcik=;
        b=jW+nQi4lD4BESPHiM4Pm3kIsXVbPA3fl+dn9lh5Zym3lHZLhZ5s8phDHYcyB5MQC0K
         Quc3+IXShl56ZZJks6CDg9y3c7jWBe1HxTAfdGg51ZiMJfanqjL8ZFKpyB9mqC6AQUhh
         wG/GM4VziPWs/AAKtQkh7f6aXWLlhtx7TBodATblNSkpyuW/nCCMcrRoh/CcBK16hIpf
         EHCCk7LRUq0/ShmbHgmtUbw6Uj+i615HDQWshkREM13FgCYg6/ydx5Ztu+raB/um85w1
         vb9/eg52Qjsl+aLLcL7pBnMfIFRVELhiQRWqTg1indcFQEtZRE3Ozxulgdld/ANB8v20
         T6yg==
X-Forwarded-Encrypted: i=1; AFNElJ877s8pRCzr1/REt5ppGdZPIX3lA7yKfMwCiH2AC1fN0dYJppHo2AlV2aTyhpm5vtmaeB58RgvE0/Mo+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGZiaPkMChrtlbT+NhBk9r/D96ZfVSyx3KPWSJv1OFFSHwLRir
	TzM/0AyoS9mGXp3+EdrhlZMhXiZerd/+8KiOxqXt9T8I7ssEIzwO5meF5/yH92cjI3m7Qs9jpnt
	kx07Kmm/0YVKfI2d8BwXImI1TarSIDkM=
X-Gm-Gg: Acq92OFuHYb7lXZtK5q1/qSF0KGqewFCRD3NeMde5WuuJFI7xrChl1/U/IQqOb/tiox
	n9G2MEbc70zDagFmnJBCx3xxk0YD1xm+xqmlOkzxwni1dcz9cK9Jk/h+ete2RiOWfbT10LjKSh/
	Qab8iSJdjlNQD1QjQQUfzooQp3kWTjMBaN/6Hm5+AaycDCR/BtijbwwgUQBWf5tAtqHmikJsHIG
	Eqklwp0E4UduCnaZodv6blQAxWIomgDUoHDz+Yuu640o2sfKHvE92/BrDOqRFDW9aP427wsrZBx
	+Y4v
X-Received: by 2002:a05:6402:321e:b0:67e:43a8:7b82 with SMTP id
 4fb4d7f45d1cf-67e43a87cb9mr2854983a12.26.1778225800798; Fri, 08 May 2026
 00:36:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260502051906.8160-3-linux.amoon@gmail.com> <20260507064050.1881348-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260507064050.1881348-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:06:22 +0530
X-Gm-Features: AVHnY4K-9ASo3Mc0vrsENtDNPwVrAYJ43tcUlhhO5e_b02Orqs4pqqj-5Q78Vqk
Message-ID: <CANAwSgSP8W8QH26-X-mdNBtncDAbHR9CtYRO0F+rjmxKfhDt9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: k1-bananapi-f3: Update USB
 regulator on onboard usb and label
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_083700_292716_C42CB6AE 
X-CRM114-Status: GOOD (  11.50  )
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

Hi Chukun,

Thanks for your review comments.

On Thu, 7 May 2026 at 12:10, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> > @@ -366,7 +366,7 @@ &usb_dwc3 {
> >       hub_2_0: hub@1 {
> >               compatible = "usb2109,2817";
> >               reg = <0x1>;
> > -             vdd-supply = <&usb3_hub_5v>;
> > +             vdd-supply = <&reg_5v_vbus>;
> >               peer-hub = <&hub_3_0>;
> >               reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >       };
> > @@ -374,7 +374,7 @@ hub_2_0: hub@1 {
> >       hub_3_0: hub@2 {
> >               compatible = "usb2109,817";
> >               reg = <0x2>;
> > -             vdd-supply = <&usb3_hub_5v>;
> > +             vdd-supply = <&reg_5v_vbus>;
> >               peer-hub = <&hub_2_0>;
> >               reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
> >       };
>
> This is incorrect. The hub is powered by vcc5v0_hub. According
> to the schematic, 5v_vbus provides the VBUS for the USB3 ports.

As per the schematics USB3_PWREN (GPIO97) pin is used to power the
USB hub ports 5V_VBUS, please check this again.

VCC5V0_SYS -> USB3_PWREN -> 5V_VBUS

5V_VBUS is used to power all the USB3_TypeA_Dual ports.

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

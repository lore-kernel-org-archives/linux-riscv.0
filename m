Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B193BCA5FDD
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 15:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OagijPKukz+5p/irEFRYgIGcCmqLz38C3dMNnb/TBzs=; b=eKpAxwGnxt3LzF
	ByfiOsRaGhshiH4z2LLaZbM3cITYZbDgA6+iOFXQqzxkm0GiA5smcISke7yi90M+IbYdG7Y4CX9hA
	XIEOa8R1Qc6mEcNFJnZHCNgEo+WbvexLLhFB/Z7BXlRdha9ufcoUJJDqULsHO+kqG71h0C7soqb3H
	FavqAt7N2RfgO5NI+S+4vhhJ6XPUanBA1ViMB7qX7GZ001zESdXdSwJiGFqwBTFqbTjFOLGzdsn+k
	aV6XaXDruiW9x0lvteoY3p7W9FgVqwZuRT6TD2sCxN9jO1zD5pjGsl8URYX6KAsczhdINAKDlZ7Il
	wQmkDxEO2iSYDWg5e13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf6v-0000000BuV3-2nTY;
	Fri, 02 Oct 2026 15:23:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCf6s-0000000BuUa-1OEq
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 15:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790954621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
	b=a691xB4ddkHHoeeItF1tespNc5rc3EoKp+JvgoQDlJluXtrr1kAX/6VLYRfbS6s8DemVGX
	9mJxdZl3EAGdT47psa0Fj4YkvfeqJzNCRuphegRPAx5PzaXFcuZdGDNJRmbDBQ0w9aLAj/
	FdoJwSaI1c9X7EdUNdUDaFnv8rb48ag=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-6KzaHOJJMXOq0ro5YCYwJQ-1; Fri, 02 Oct 2026 11:23:39 -0400
X-MC-Unique: 6KzaHOJJMXOq0ro5YCYwJQ-1
X-Mimecast-MFC-AGG-ID: 6KzaHOJJMXOq0ro5YCYwJQ_1790954619
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso478481485a.0
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 08:23:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954619; x=1791559419;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVjH0D2jt0kRvnH6DkUbM3A4qPDRx66aQ27YIk5b7Y4=;
        b=HreRNnZ+9GElNISYUQzaPO70FhfUm/S+A/nYfoWa3B6Rp9znaCwW6TfqHeLxB9vJfx
         iC2l915GTyizT3py5MYsaBzZtTkizBmuOMSMPEasHVFuOnG7nc0pMChUZ8zcSobvquet
         kjm3QvsLS7yaZfcubouRQhpmdRfgn0gpD4J125+B9CGHuCnc+ppX7MeQkLxa115D71+0
         MYVKKNiZCwhX+wWbB6Of41eoU6oieGZaDCTMjks8SBfgx6DVoYE5ANPsscOZDER3pklh
         J5xKTuarS18fD1qJoiTpFdfD+QTAk8JuoLtjntfcpmox2v96sXaMFuP3IImGLqNEsEWY
         yRWw==
X-Forwarded-Encrypted: i=1; AKwUvBwOe7QDZI0JDKnSDikL5gxBKwP4nM9/34Jv8dQFAW62ttNWXOXfDf9Qr0htygS1UAxHlJNKKBdHRD4P9w==@lists.infradead.org
X-Gm-Message-State: AFuF++kaN1HQfdN4eLcK5XgCTmTk7995qu9qBLOi/QmXEDh/8Eq8qNcg
	vWuKjH6+/8EgFBLLjRsKTULPGBCipOfxkvrsWTA4VIC0st1zkF1ZmN7+fmPQba4RfmxLZVYrcgD
	GO478TzJqSOmt1HBCS4wK7k6mbglUsRzW/pm6vLHIR+DrN7I3KHHxqOfKmGticRUXFL/dc08SdM
	/eAw==
X-Gm-Gg: AYBFou1VwlUdQ7ZvMl2rqgZgfj2c2c5Owoy0/afmVOOg6OPtGBWRKG6iXnWRpNuuO7L
	nNO5VPVhivXE7CwM3Enl6vPLDt2ML+0EofjBSJcAk2sxWcyud+H9koQaq0kV3zBYC1gfdQTCql7
	9m3yQusG/Bbwq+JKrZoFRw9DeZRBBiTNMz0V8fpPNbwNAtuv2gi2MmoAHzBuGsIHgJxPgyoSTTL
	pTSuPVVz3jboEQ0DxYfe75uPcuLaZ65rZBzB+Z/+S1bvl+3avsKNzX5GmcmgMa+3eNLdm0UKt8w
	kR+eJ6aAeVcOwlY3Dih5/qaStXKQeojMVGcUm5Xl13ArGOT5xELQWSK10y5vyn+klHNcsxguiGG
	dLzimDAQ9ewZok0uZ18U5QbF9mvpvmINuTuw=
X-Received: by 2002:a05:620a:480a:b0:93a:d67:9ab0 with SMTP id af79cd13be357-93ce7a85665mr565821385a.4.1790954619250;
        Fri, 02 Oct 2026 08:23:39 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:d67:9ab0 with SMTP id af79cd13be357-93ce7a85665mr565813085a.4.1790954618588;
        Fri, 02 Oct 2026 08:23:38 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2ec917sm242866585a.46.2026.10.02.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:23:37 -0700 (PDT)
Date: Fri, 2 Oct 2026 11:23:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <ar_MdxhafYCvqci_@redhat.com>
References: <20261002-dr1v90-cru-dt-fix-v1-0-c3e0b5d4c30d@pigmoral.tech>
 <20261002-dr1v90-cru-dt-fix-v1-2-c3e0b5d4c30d@pigmoral.tech>
 <20261002-manpower-croon-26d578f57143@wendy>
MIME-Version: 1.0
In-Reply-To: <20261002-manpower-croon-26d578f57143@wendy>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nsBRGMYE3nWWGG42g7XUURv2wpzgx_42tCcodx2FBN8_1790954619
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_082342_476147_7978A3D7 
X-CRM114-Status: GOOD (  23.03  )
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

Hi Conor,

On Fri, Oct 02, 2026 at 08:09:08AM +0100, Conor Dooley wrote:
> On Fri, Oct 02, 2026 at 02:07:01PM +0800, Junhui Liu wrote:
> > The external CAN and watchdog clock inputs are not routed on the MLKPAI
> > FS01, the only board currently supported. Drop the two fixed-clock
> > placeholders from the common dtsi, as fixed clocks require a valid
> > clock-frequency property.
> > 
> > Both clock muxes select their internal parent clocks after reset, so
> > the CRU operates correctly without the external inputs. Keep only the
> > required oscillator input to the CRU.
> > 
> > A board using these external clocks should define them in its own
> > board-level dts and override the clocks and clock-names properties of
> > the CRU node.
> > 
> > Reported-by: Yixun Lan <dlan@kernel.org>
> > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1V90")
> 
> Uh, why is this in linux next?
> 
> Brian, please don't apply dts patches to the clock (or any other) driver
> tree in the future.

OK, sorry. I just checked clk-next and this is the only dts that I
applied. I'll rebase clk-next and drop this so that the tree only
contains the drivers.

Brian

> 
> Patch itself makes total sense,
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> and because it's easier
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> > ---
> >  arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > index 574c6608aef0..fe85d01563ad 100644
> > --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> > @@ -44,23 +44,11 @@ cpu0_intc: interrupt-controller {
> >  	};
> >  
> >  	clocks {
> > -		can_ext: clock-ext-can {
> > -			compatible = "fixed-clock";
> > -			clock-output-names = "can_ext";
> > -			#clock-cells = <0>;
> > -		};
> > -
> >  		osc: clock-osc {
> >  			compatible = "fixed-clock";
> >  			clock-output-names = "osc";
> >  			#clock-cells = <0>;
> >  		};
> > -
> > -		wdt_ext: clock-ext-wdt {
> > -			compatible = "fixed-clock";
> > -			clock-output-names = "wdt_ext";
> > -			#clock-cells = <0>;
> > -		};
> >  	};
> >  
> >  	soc {
> > @@ -128,8 +116,8 @@ uart1: serial@f8401000 {
> >  		cru: clock-controller@f8801000 {
> >  			compatible = "anlogic,dr1v90-cru";
> >  			reg = <0x0 0xf8801000 0 0x400>;
> > -			clocks = <&osc>, <&can_ext>, <&wdt_ext>;
> > -			clock-names = "osc", "can_ext", "wdt_ext";
> > +			clocks = <&osc>;
> > +			clock-names = "osc";
> >  			#clock-cells = <1>;
> >  			#reset-cells = <1>;
> >  		};
> > 
> > -- 
> > 2.55.0
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

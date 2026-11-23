Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955E2606A321
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0GiY2VxB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JTCO8u41
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tyPzIMHNTFr07Jv4z+PDJkdicsgBgFPTCQU2YeWBc8c=; b=0GiY2VxB1h5vHZ8wwPhZb0AGLt
	3B/dZCfb0zDRDDZb/uT4EpO405qNRJnJKfR94tJt800IMrPI1iMrbsjiRAvzwMFKiNPkLMrjZtmXX
	vLivz+wW1p5V7lXk1/dK4hvS3aFG0ACmpdqm+NU8tCjnEOg4djApa/bvR4jwEjKJjKYSe7KeDCkcA
	dGPHiiBm8AN4EBsQBD+cAvh0wPbb5e64/jvjm3rfJU4f4N0rL7+s0E9gPQaWOg17lLJHCOEU5C7y6
	QjDB+3SZ2lvGT5ofvJl85IG3TmvmxtpaZHS0kRhZh9Yv5K+YMVOsDqfUuC8RRuTzM9MXIXwNkMqob
	SiVlN0Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdk3-00000005Cxr-2G5q;
	Mon, 23 Nov 2026 23:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdk1-00000005CxR-3NhA
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 23:46:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46E4E423C9;
	Mon, 23 Nov 2026 23:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B20F1F000C4;
	Mon, 23 Nov 2026 23:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477592;
	bh=vP+ADNOiSpoNKhzRfreKdcuyfRb2mBj2cg+6BGIcmWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JTCO8u41i5Bb63hP2HzKMLTu5crJT75CuGJBKjDW9CVzdAiH9b/q2NiyQXnq06ysN
	 H+JC5kMU8GuxnJ13S18qOoAnHU+W0zg3nRvfMTddR1TdBCNVZ/Qg4n0rER/VhxFdm/
	 HQf5Yhwa2mg7d6Og6Q/qFQ5aSPq7zLM59V6HaoPxRYHT+0IlngnLoDArP+WU78u6eX
	 kt7gVcGOG9jlHpyo7ic1sxFDh6uSkWfAN4eYOLfVdl7fBy6XxoxPFnAnpYBoqbWDIL
	 y14H4zJnW30ARhaWfLhc+B4cWyq62UHAQ/7OZrkMRb+dd6c/TnjmBr0M76L5mn36da
	 I/UK0uuJKoQPQ==
Date: Mon, 23 Nov 2026 15:46:31 -0800
From: Drew Fustini <fustini@kernel.org>
To: Thomas Gerner <thomas.gerner@muenchen-mail.de>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: thead: Enable bluetooth on
 BeagleV-Ahead
Message-ID: <awTQV54SY8-p0rCx@thelio>
References: <20261020132604.90708-1-thomas.gerner@muenchen-mail.de>
 <20261020132604.90708-3-thomas.gerner@muenchen-mail.de>
 <awDZBiX1VoSkO6F3@x1>
 <a1b47af8-72bf-4f3e-9ece-e2ceeb97a682@muenchen-mail.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1b47af8-72bf-4f3e-9ece-e2ceeb97a682@muenchen-mail.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 12:09:29PM +0100, Thomas Gerner wrote:
> Am 21.11.26 um 00:34 schrieb Drew Fustini:
> > On Tue, Oct 20, 2026 at 03:26:04PM +0200, Thomas Gerner wrote:
> > > On the BeagleV-Ahead the bluetooth module of the Ampak AP6203BM is
> > > identified by the btbcm driver as BCM4362A2. The module is connected by
> > > UART4, several gpio pins and an I2S interface. The I2S is currently not
> > > used as there is currently no driver.
> > > 
> > > Signed-off-by: Thomas Gerner <thomas.gerner@muenchen-mail.de>
> > > ---
> > > Changes in v2:
> > > 	- use default pinctrl definition for bluetooth in and out pins
> > Thanks for sending v2. Sorry for the delay in review.
> > 
> > > 	
> > >   .../boot/dts/thead/th1520-beaglev-ahead.dts   | 85 +++++++++++++++++++
> > >   1 file changed, 85 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > index e16484a47653..7161a9d4c61f 100644
> > > --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> > > @@ -76,6 +76,23 @@ led-5 {
> > >   		};
> > >   	};
> > > +	reg_vbat_1v8: regulator-vbat-1v8 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-boot-on;
> > > +		regulator-max-microvolt = <1800000>;
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-name = "vbat-1v8";
> > > +	};
> > > +
> > > +	reg_vbat_3v3: regulator-vbat-3v3 {
> > > +		compatible = "regulator-fixed";
> > > +		enable-active-high;
> > enable-active-high has no effect without a gpio.
> > 
> > > +		regulator-boot-on;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-name = "vbat-3v3";
> > > +	};
> > Nothing can switch these two rails so regulator-always-on describes them
> > better than regulator-boot-on.
> 
> 
> I see. With the next version I will consider this. The regulator
> definitions are here only to prevent the hci driver form printing a
> message about missing regulator. Once we have the final regulators for
> the AON subsystem we should check this definitions and replace them if
> appropriate.

I looked at the schematic. VBAT is fed from VDD_3V3 and VDDIO from
DVDD18_AP, so I think the two regulators should be named after those
nets, something like this:

    reg_dvdd18_ap: regulator-dvdd18-ap {
            [..]
            regulator-name = "dvdd18_ap";
    };

    reg_vdd_3v3: regulator-vdd-3v3 {
            [..]
            regulator-name = "vdd_3v3";
    };

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

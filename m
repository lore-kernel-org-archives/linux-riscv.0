Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C77CCD18D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rhQBg6NggLO43HmJI9QdydQRwbzCMfg9M/c8cXg7psQ=; b=4cD+xVKOWiFdgs3ITC3YibPWaQ
	ZaCIAwwV78eZyaor+uhwKjOVj+tambMeMemL1lA6JW/qySaJWNCyq3rChiCSRP8wVh/2IkVCxYsAS
	7eoLueujMAHBNL1mBTRLmWFpi0Ah/jXVWCTC025afXv2ToiPRrRRcGVTDaG1LpFcYfa4KhhwyLhE+
	L9/rL6kNzkfWUdcIRsKG2Lid9j8KWTcX75hWgNds2UOCXya8mrIVIvk5UacRCwzyF4dFdwaW8wYBd
	IMcxIoKxzJLSwxsNve/NIo1ruT7WTzeVe7hmpoWnub6lZ4OoVJWyPf8YsImJOkqXfRQQ2EHoVM0Qj
	tFlcNkLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Lij-0000000Dv2N-32mu;
	Mon, 13 Oct 2025 16:48:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Lih-0000000Dv1m-1u4w
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 16:48:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39248450FE;
	Mon, 13 Oct 2025 16:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D31C4CEFE;
	Mon, 13 Oct 2025 16:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760374101;
	bh=elwGg7bAxs37xxGUqiUArj6P97nHlNxZfgLS3Wd1CyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u0ik8Aj+3Zh2hpmVrK05uKhSNXSQFg5mKOv+1ewCFmP5D3O4Yc5gnx/5rZdpHsUpa
	 dWAx1WMi4mEu+Y4n9qsIi5IFrDql7U3b/ztL3E20N93kp3O+8o2vxlJiU/lYg5Zo6o
	 a90s4pErWdUT8xZ/M0L3b6us4lXWRobDbyp3DV0OXNCNSEc/QqU69m9y7K/VnrScdn
	 SZhQRZ82zsyBv08zwajcNUgzIONvqyPiMiY0qk6f/DM7crPcettPkvZhB0kuljToT3
	 JW5pvDr92ge+VIYxzr0L2tgo5UJ5C/80RUoTG8vYMUhz+93KkFlNBh2UVV0MqYlNql
	 1+x+kvSxfmowg==
Date: Mon, 13 Oct 2025 18:48:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Benno Lossin <lossin@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Drew Fustini <fustini@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v15 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
Message-ID: <ayuqnx7fjfe3zwicvdbdr3qsgb4w6s2gwjt7r3m5ikzrylmium@hsrxazwelnvp>
References: <CGME20250930122729eucas1p2c4f1c07a4a504a59ba691b407a39420d@eucas1p2.samsung.com>
 <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20250930-rust-next-pwm-working-fan-for-sending-v15-0-5661c3090877@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_094823_530427_0690005E 
X-CRM114-Status: GOOD (  11.68  )
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
Content-Type: multipart/mixed; boundary="===============4542767014855383640=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4542767014855383640==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ixctn32fehw7zduh"
Content-Disposition: inline


--ixctn32fehw7zduh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v15 0/7] Rust Abstractions for PWM subsystem with TH1520
 PWM driver
MIME-Version: 1.0

Hello,

my diff on top of your changes looks as follows:

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index dd6db01832ee..e7f770ecfe84 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -812,9 +812,8 @@ config PWM_XILINX
 	  will be called pwm-xilinx.
=20
  config RUST_PWM_ABSTRACTIONS
-	bool "Rust PWM abstractions support"
+	bool
 	depends on RUST
-	depends on PWM=3Dy
 	help
 	  This option enables the safe Rust abstraction layer for the PWM
 	  subsystem. It provides idiomatic wrappers and traits necessary for

i.e. make RUST_PWM_ABSTRACTIONS invisible, it is only supposed to be
selected and there is little (or even no?) use to enable it without a
selector.

diff --git a/drivers/pwm/pwm_th1520.rs b/drivers/pwm/pwm_th1520.rs
index c9fd1d8d17bc..a5666052b7ce 100644
--- a/drivers/pwm/pwm_th1520.rs
+++ b/drivers/pwm/pwm_th1520.rs
@@ -121,6 +121,7 @@ fn round_waveform_tohw(
         wf: &pwm::Waveform,
     ) -> Result<pwm::RoundedWaveform<Self::WfHw>> {
         let data =3D chip.drvdata();
+        let status =3D 0;
=20
         if wf.period_length_ns =3D=3D 0 {
             dev_dbg!(chip.device(), "Requested period is 0, disabling PWM.=
\n");
@@ -141,18 +142,13 @@ fn round_waveform_tohw(
         if period_cycles =3D=3D 0 {
             dev_dbg!(
                 chip.device(),
-                "Requested period {} ns is too small for clock rate {} Hz,=
 disabling PWM.\n",
+                "Requested period {} ns is too small for clock rate {} Hz,=
 rounding up.\n",
                 wf.period_length_ns,
                 rate_hz
             );
=20
-            return Ok(pwm::RoundedWaveform {
-                status: 0,
-                hardware_waveform: Th1520WfHw {
-                    enabled: false,
-                    ..Default::default()
-                },
-            });
+            period_cycles =3D 1;
+            status =3D 1;
         }
=20
         let mut duty_cycles =3D ns_to_cycles(wf.duty_length_ns, rate_hz).m=
in(u64::from(u32::MAX));

i.e. round up for too small period requests ...

@@ -189,7 +185,7 @@ fn round_waveform_tohw(
         );
=20
         Ok(pwm::RoundedWaveform {
-            status: 0,
+            status: status,
             hardware_waveform: wfhw,
         })
     }

=2E.. and return 1 then

@@ -355,7 +351,7 @@ fn probe(
                 "Clock rate {} Hz is too high, not supported.\n",
                 rate_hz
             );
-            return Err(ERANGE);
+            return Err(EINVAL);
         }
=20
         let chip =3D pwm::Chip::new(

at least pwm-stm32 uses EINVAL. Having said that, I wonder if this check
is sensible here at all. pwm-stm32 does it to ensure that
mul_u64_u64_div_u64() does the right thing, but this exact issue doesn't
exist here.

Otherwise looks fine I think.

Best regards
Uwe

--ixctn32fehw7zduh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmjtLU8ACgkQj4D7WH0S
/k4oaggAhdfagEFpKozser/0n1q4mr04hh5Zneh1XD8FkXH3oRpDUZVb8r4ePsFA
8VTDCq/Es7HpPe5XowvaKMybERSkXoV2ixoJFwtZx381Tdc6uqptStUKGMfzltsN
u8j6b213lzwtg9WgBM6hk+rUUzm9rzJ/Iz0VrEgGF+iIt0l7MBSInjZ+I0JDmbMu
bL6/wiWdHBVvcq+QAX4Edf3RHMX/a9s1htv/+uxWRbFf4/xRn+1gOuDBjJbTqA0j
44JY4XEZiBlBTvxMR+CiI/pq/K5ttn9kpOttYIgVfYiru6YPMLyozSLAL4zpxQDP
TRJOj1WQexbASB2Smr3Z4MgE60NYlw==
=gshz
-----END PGP SIGNATURE-----

--ixctn32fehw7zduh--


--===============4542767014855383640==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4542767014855383640==--


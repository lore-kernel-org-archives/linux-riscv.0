Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E237606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Z6CZl0Hh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fl8Hm/q2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wwgvwLvQ21FiTF5sIa2B99cR+C46/qnrWwUitdrz2DM=; b=Z6CZl0HhUs/n8+TYxzm+KXtGm1
	wTpK2yvmUbxy/TpHTQr22tbgBunhuSg6IRfawlUzC5CKvvwgrwDP9+K9oBo2tOF2W5TLZKaXZeoAN
	WtwYGT27gA9N4Rc5QpwS4rsPUgWRDPQZEC02LVsDvnodU8AzBG5I43V79+sxpevgz7KENAJ0tCXjr
	tmpSWFpNSaS7+Ne1vyWF7e5v13imsvRjcguv8FU46UGqa6CZlKJyk3ZS6Cr4/j1elgGQY7SNbsNlZ
	Ls6MD+TRUVvcb6+QWW6o9Q562e4YSA6WsWAvbouI305Rw3157CQ1IZe7oswE7mtgdPImM5r42jQze
	wcmux4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrGO-00000001Q3W-12wb;
	Mon, 16 Nov 2026 07:36:28 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrGM-00000001Q3A-05cg
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:36:27 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so3649855a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:36:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794814583; cv=none;
        d=google.com; s=arc-20260327;
        b=AqZe3A0wAaD81i+U4sFUvTqgtlM9Wqyiu4XxoPUuzoAgQDNoDbGah0g8kc56mpx9hS
         wGyI/PNr+B+88sysP1TCbVohdBAXWeNY0APKtSYAQmt5xDUJEem2FlIbSRLGC72ZGEh8
         IH0CCwcRS6WEQE7HQpZH7iTJQm4F9hWn6zLh10fGG4NSeBue/O56oj9XVgUckGqS8+xZ
         IvdLnl3JaSFNXyBBLHd7HIcbI/Og0pahAkmkfmT4/Azlm+U6L7rJxtsszRJ9o+D2VBvc
         gtMKtRecJQuJ4MaIJ8XaL29+cjpV/OmtIiTARZTEcqb6CK4adp/AuQmoqyYVSQy8cgU8
         CVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        fh=LZ7ix6sOxWm/B6jUb7CbUUxjOHuGxXn05c7zU0VthhQ=;
        b=q34Ud1xXkbfhv0kFnmeSoqsY7NDPHJ+eGuAowtAsQi94CPlFMdXFdj2lnVlP34aqv2
         5pU6JMdHzhcb5tNDPJsiaxxlJdUEu58fr/0Y6YFu56s3ZJeQsyAdfBbAWO9ZbSwkNliG
         ZlJ8cJmMiGPavr9WzTl/C4lIWFmVe8ck4aZ3Xd65aAagd6sRMIgEYpMAruLxqec7p08G
         USqp9CMMDzeRxMnOdUKhEZocaHhrWAL6MEhakb5cjcGxcFTArFsJseedPlVAq296bv59
         FHhKdJIGMQ85WNowulRRBl1QB8D106RDYNJDtVNy4acv66H3Th56PS20Z+rSB6ioq2g9
         ddRA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794814583; x=1795419383; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        b=fl8Hm/q2/g6MFOgFPgxm8T93kjiTzcf/o/2A/04I37TdvZBHY2EeScauCFaLBWB44y
         cDQcVf1DUKMDIa5uTn4+soF5eG/UDung5wiUrg+lzwSBDXm8aS5/neRgr7jZNxNOwEXj
         IpQsr2bxFqcJ38AkwaJFMyPTlXzpZUYcAInKksAmDWvJ97tX1FcOCnVk5RZeblfpXK6r
         C3904hbNIco+72FDy8dlIJhd+fd3h+sRXyKIAJdHi3lBKe0u9q6kKJXeptdRqeJFUD1z
         dkdLQ66+/AM9EJMxHN9qONDfwYvZxwcucEdlGNojjlCXru10eaWQJjUOiQ/qcjO6PurI
         nvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794814583; x=1795419383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NuMRN9mlOmZCEKh1xHdz4U4CqJ8o4hxQExiC+l3Niro=;
        b=poxdiIfYcj+BixyRd2nD1/Hyrdq+Kl16i99HljO1Nn+EWp5p17dQFepvKkil/g8Pex
         ATUWKCltOI7TI+a+vjCZXxKiRAFUvU3D/1KJzTTFg78MOCh8q61l9qy8u0jFUEXCQdNK
         BNEa14/mV69DObbmXiAAzf5VnZ/uV0ZBvx/g4T3Avy1JrRKqCP9VYsYeGQ87LnAM5f1O
         u3l856NGc1yCP+qL2JGTI8H8XsFRyk5/Dg2znk+a4U1oFNAKJY/QK+M42oSy0v5GV7KL
         jpUZ+Hyl2Zlj4JxPDLQ6CQEGJMhRUVkpidNbjH34YMU9yyXE22LUM504q5kXiBKo/Zqc
         bA+A==
X-Forwarded-Encrypted: i=1; AL+hErGfyljbgak2NzlxMTKZphrao7T1boupeSUyjRVb6QkoN8qMx5SP3sMyWafMIHl2fCZAqDT66wOX10KlYQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8St4loy/xslXtuIW+k86S8W7N7KZ1HaCIVPTOh+doZNJ/6mfYM
	4e84AOMuK1EO7OJN5HEJDB9E9Ntm7nv75KQbt8cb5+euosQ/cS2ht8PiEOnudYHZX7MbCzdmF1s
	GQ5Hl2+Bd6wscu5gxMvYiNPN0GXSVlCU=
X-Gm-Gg: AYBFou3OEXGb0F5a/XY0kl8yKH06p3CTLcrCIhn1b/bRw+stuUrGfTyaxLcJoJvdb3c
	jMBnAuxx6v388rEpnOCfdXACDTaMEXZgmM6uUXMRE1Cysm6xRNFWzwPsOTzZ7ejwq4V7IpsHDXK
	FaqPxR0Sg4Wk3GeDtzOo+Ydy2K2Jm9cTPITaEifCcjr1TXWIqOfgTu84F4lMdmNGUP0GHFl4b3K
	Lik88Kn7Ry8+vrDbNNT/LzMya1NJWb31GiXj3CfsStXRfbBRTy1p6uOT8zYkJm06t/bS6mC5iiO
	m3bdhWrGjAT8bLxSh2p5TgRHMY/kN39O/ehlqqyFf8yocHGqlocUbxwIIB3C4IEFRJrRaXStqFk
	yzefIfk7EALWxZoSXMIU46T9kRkOEM7Ae64k2lTOdx4ZB6vxy0aLlRtQi
X-Received: by 2002:a05:6402:5d4:b0:6b5:5fc8:9ca2 with SMTP id
 4fb4d7f45d1cf-6b7c0c7dc86mr6801231a12.34.1794814582850; Sun, 15 Nov 2026
 23:36:22 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261110061429.2036-1-linux.amoon@gmail.com> <20261110061429.2036-2-linux.amoon@gmail.com>
 <avpN-gFOvTBAMY6G@venus>
In-Reply-To: <avpN-gFOvTBAMY6G@venus>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 16 Nov 2026 13:06:08 +0530
X-Gm-Features: AclHuK_zi0cJ5esU4k_l4Yl1mv76j_qYKuptpaeB4AEIgcR7sleibDfPZTNW_HY
Message-ID: <CANAwSgT_k35_waHL-+iU93f=k3fjFAPXhk=exRz-XHMm2MqREA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] power: reset: spacemit-p1: Use atomic I2C
 transfers for power-off and restart
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_233626_288283_3D220BDB 
X-CRM114-Status: GOOD (  26.87  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi All,

On Mon, 16 Nov 2026 at 11:33, Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Tue, Nov 10, 2026 at 11:44:27AM +0530, Anand Moon wrote:
> > The SpacemiT P1 power-off and restart handlers use regmap_set_bits()
> > to access the PMIC. However, these handlers run in an atomic notifier
> > context (specifically within an rcu_read_lock() critical section), while
> > the I2C-backed regmap uses a sleepable mutex.
> >
> > This triggers a "WARNING: suspicious RCU usage" warning due to an illegal
> > context switch in the RCU read-side critical section during shutdown on the
> > Banana Pi BPI-F3:
> >
> > [  563.803475] WARNING: suspicious RCU usage
> > [  563.807813] 7.3.1-ARCH-RISC-V #1 Not tainted
> > [  563.816614] ./include/linux/rcupdate.h:387 Illegal context switch in RCU read-side critical section!
> > ...
> > [  563.841445] locks held by shutdown/1: 2, last CPU#0:
> > [  563.846694]  #0: ffffffff8404fb20 (system_transition_mutex){+.+.}-{4:4}, at: __do_sys_reboot+0x230/0x29e
> > [  563.856806]  #1: ffffffff84167860 (rcu_read_lock){....}-{1:3}, at: atomic_notifier_call_chain+0x4a/0x1c2
> >
> > Replace the regmap operations with atomic I2C transfers to avoid sleeping
> > in an atomic context. Preserve unrelated register bits through
> > read-modify-write operations and check for atomic I2C support before
> > registering the handlers.
> >
> > Obtain the I2C client from the parent device and verify that the adapter
> > supports atomic transfers before registering the handlers.
> >
> > Tested on the Banana Pi BPI-F3 (SpacemiT K1).
> >
> > Assisted-by: LLM
> > Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > Cc: Aurelien Jarno <aurelien@aurel32.net>
> > Fixes: 28124cc0fb8c ("driver: reset: spacemit-p1: add driver for poweroff/reboot")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
>
> regmap runs i2c_transfer itself and thus also uses the atomic I2C
> transfers. The problem here is regmap itself. But instead of moving
> away from regmap, the atomic use case should be supported properly
> in regmap.
>

On  RISC-V platform, poweroff and reboot are already handled by OpenSBI
through the SBI System Reset (SRST) extension. Linux delegates these
operations to firmware using SBI_SRST_RESET_TYPE_SHUTDOWN for poweroff
and SBI_SRST_RESET_TYPE_COLD_REBOOT or SBI_SRST_RESET_TYPE_WARM_REBOOT
for reboot, depending on the supported reset type.

Therefore, there is no need for an additional Linux PMIC poweroff/reboot handler
on this platform, as it duplicates functionality already provided by firmware.

While supporting atomic operations in regmap may be useful more generally,
it is not necessary to address this platform's shutdown and reboot requirements.

I tested this on the SpacemiT K1 Banana Pi BPI-F3 after removing this PMIC
poweroff/reboot driver.

OpenSBI commit which handles this extension

d9637d00bf47 ("lib: utils/reset: add SpacemiT P1 PMIC support")
b10e18ec854a ("lib: utils/i2c: add minimal SpacemiT I2C driver")

Similarly, on the StarFive VisionFive 2, poweroff is handled by
OpenSBI through the
AXP15060 PMIC, so there is no need to register an additional poweroff
handler using
devm_register_power_off_handler().

OpenSBI commit which handles this extension

568ea49490d9 ("platform: starfive: add PMIC power ops in JH7110
visionfive2 board")

-----8<----------8<----------8<------
diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
index 50df66de24e06..069259f7d7c15 100644
--- a/drivers/mfd/axp20x.c
+++ b/drivers/mfd/axp20x.c
@@ -1458,8 +1458,14 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
                return ret;
        }

-       if (axp20x->variant != AXP288_ID)
-               devm_register_power_off_handler(axp20x->dev,
axp20x_power_off, axp20x);
+       /*
+        * The VisionFive 2 handles AXP15060 poweroff through OpenSBI.
+        * Avoid accessing the I2C PMIC from the atomic poweroff path.
+        */
+       if (axp20x->variant != AXP288_ID && !(axp20x->variant == AXP15060_ID &&
+                               of_machine_is_compatible("starfive,jh7110")))
+               devm_register_power_off_handler(axp20x->dev,
+                               axp20x_power_off, axp20x);

        dev_info(axp20x->dev, "AXP20X driver loaded\n");

Please let me know if this works on your board?
>
> -- Sebastian

Thanks
-Anand

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

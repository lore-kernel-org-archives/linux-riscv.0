Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7ECC44529
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 11:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bkudvg7FP4wwJvrBRfaKy6THTbUupQ1w8mZFYdipeJY=; b=zvnJPc5pp+iHkh
	xYOWVVeOp279r20aq9UV+9jI8szK662bnHGtuKPdkbzgTg+oCB3WJNnKasjSfvT06xBHjNrHKZozt
	L4DRyKYbI1cSjZTz85qqg1viOo0bQvMKtaw0LVGyj9rqA9auJWHeLtuYVKWBqvTsKJD2AZFy5Pbki
	/NCECkNHsQVI6PlTHT3rVBdPJ0IbZmTcanew3Oc6jWFhv8w3LTcxK6xgbSU4Qetz9BOuxepHj2nEG
	zvqunTvS3/STwIxARI2aXA+/mvNnLg/1OESmDhRRPARx8YaOLhdTru83ijX7fgKaO7CGguxOA1iML
	QtxrsS8OsmPSillnXbpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm91Q-00000009Ln9-0Nfd;
	Tue, 21 Jul 2026 11:52:28 +0000
Received: from out-174.mta1.migadu.com ([95.215.58.174])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm91N-00000009Lmf-1Cbr
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 11:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784634742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saPQNRXNr4uVjroUD0Lw5F38mIc84uTGGZFC3b1RqYo=;
	b=Q26gUfo1WQCFaXMCnKGGdL3LL9K4urpBsFjjlc8rJ2iknWOPf2bp22QYMRWaK19H8IrSso
	LI2cvDmA01yHI79tJaqXq5/a5/BHbimUbvxgO+l1+pDDVG95y9Sf5BHpuTZt5NDRn6Aefp
	D8N83wAXa7XK81tCXohhDc7Q4E/9C50=
Date: Tue, 21 Jul 2026 04:52:12 -0700
Message-Id: <DK487PYQKFZK.HX96HW3B22XZ@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
	<20260721-ctl2301-v2-4-ef5fb342872a@linux.dev>
	<20260721100004.D93AC1F000E9@smtp.kernel.org>
In-Reply-To: <20260721100004.D93AC1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Mutt-References: <20260721100004.D93AC1F000E9@smtp.kernel.org>
X-Mutt-Fcc: =Sent
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_045225_553506_D8144D6B 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jul 21, 2026 at 10:00:04AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> Will this corrupt the temperature reading if the I2C read fails?
>
> In lm63_update_device(), if i2c_smbus_read_byte_data() for the LSB returns
> a negative error code (such as -EIO), it gets bitwise-ORed with the shifted
> MSB. The negative s32 error code would sign-extend, overwriting the MSB
> bits entirely and resulting in a large negative temperature spike instead
> of propagating the error or maintaining the previous valid reading.
>
> Could we check the return value of i2c_smbus_read_byte_data() before
> merging it into temp1_input and temp1_max?

Good catch. A failed read must not be combined with the other temperature
byte. I will read both bytes into temporary integers, check both return
values, and update the cached 12-bit value only after both reads succeed.

The existing lm63_update_device() also truncates or combines unchecked
i2c_smbus_read_byte_data() results in several other paths. I will address
those existing error-handling issues in a separate patch, rather than mix
that broader change into the CTF2301 support patch.

                                            - Troy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

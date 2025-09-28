Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CFDCAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 07:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlWE0d67ho94YEHlutQBjRMk7un+7W47Cjk84oghyZ8=; b=4T9sC1EHKeJzQC
	yD1OthsEyNNVz9UlU7RhNuTyGdFsSsKcbX2FNl1uuZzyeo7RmDs67pvOCI7i0cKeHy3w4b5MDrx9r
	VP3/TkDM9TCCBp+OSbiBYuUo/LSiXUwruuRAUigmvvFY3Er4vfWl03q5phkZB5w/FJmSMUI57knNL
	0mEPf+WYEGjl2lp3+7DeGjM1Emqga6fLn9jUYmqqd7EE3PKj1qaOqzy3jUkudYPiFMLmcNdQPoK05
	tMV9ldJ38qia+MLvObhAZ9OfrcpEjag0CY3RfXpMX5ZrIosEpPVu3gExuCZRrmZjFzSWRKq22L2Ys
	psBFo941WAOFsul+DDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mE9-0000000EA2V-0TfF;
	Sun, 28 Sep 2025 07:53:49 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2mE6-0000000E9wJ-0L6e
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 07:53:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759045955;
	bh=LVmDmo6PMPQDtwg9AJ93IIu2tcqLRDiuOqFTJD+GAWo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=eEvcYyJGo8HWjI5bCF2y51ZhNILgM+JRDGd6HzTyufpIG9OI0Rx/ttV+9CefTm1T4
	 uaCEANshfy1SWHfUdLRuLNm2x9pkxFX3DBA4tgOphVb6kDYOfCYi7dPEDfIEJk+A42
	 zSaAqD+GXBCP91ROnflGmDJbSj0+mgTAs8c3kQbk=
X-QQ-mid: zesmtpsz6t1759045953t24b1fd8e
X-QQ-Originating-IP: cCgCvlPvaxTaHT2HEXnf2C6AVB4pr5nTsaxpw0F2OhE=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 28 Sep 2025 15:52:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2715566553721179058
EX-QQ-RecipientCnt: 15
Date: Sun, 28 Sep 2025 15:52:31 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Message-ID: <B015018225608C50+aNjpP35hN9KOyQph@kernel.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
 <20250928074914-GYA1344940@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250928074914-GYA1344940@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NQh5cDHo6fkF+Wfi1U/k5+kzGMBH5pWS/cRi9O5SPTfZrkZ/KahshSYM
	EY0P0EiiO6MfARL4F8RlU8RhdQ6jLcne+SzcD3RbjS/zeKzeD2eh4qmB50P9iwEmWEK3qR/
	YZa89Z/KdEz5Yzpjq1GhBxe578e1vJrNK/TFmCj8YzJRpZtlQkbgBetTi1mXx1GUAuFA+IF
	mPUDK21ttZo6gbwHo6eZ2JjZJzcfS2hCLToLaLEDaXJ+uv2KSQwmuLa/q70VNO8tD8zYw5P
	4ffijXZCoeMOeeDQEMqGbBKltwvudz+Juj7WMx0DioKnYkrLth1mUxLL41rDaZlN7u/lvHN
	USsoJt75rWi77sAXV/AApA0N1yCXvr+mz8733heN8i4qv8xcf+4ztoXFzefSkCQEpikVByV
	qI2i9md8vKtmRVoK6Sw0jviao7famiogz4hmhdg6NPjHGO/zQSNjqh6T1o4LQYKga7D70t7
	JLdbax1jUejPakItwFXDuHbDZKfbRzZgTP+IIrkzo30yW1tl4Nb8XiTucHtzf2T+6BT4v/V
	pAVTs9n13a0BWhhdq9X6VYsKP5S+kvQ6J1DMMoJQAc+79SC4mNlj3zKa53VVhNQqfQ9dJBc
	eaXYe9M3x2/v5MtZ/vGftFKhmpBPHzuz+OyFtkC+c7eVkGmTBRG9lVS3ZXTsYYv4lPiIYH0
	mojQlTHTJLaCPW3pLu+u3544T+IZiHDKiVBOqxOu9QDX5XF+klpSxC9QNUiUnozW7aN2+ke
	pe8W+4yQEwhnv7MIIGKjWQQiO9QJWRicgD+IWGYQZ5IzXquw4erE8PIBOsK8rhP5Ka5CspM
	6RexnEHbiYtUkPknvQShhGjmr+WbNMF4V3CRmBEQuAo7hABz+8hZ7VC/1ujdhpGOf+cU4KX
	CaK4+noc3h/UPcc+kLqDdlDZ6ptDDw4OzlOotTrDPzNOM4IvWdtzHRJJgvxFsvuc9MFJthO
	RTm2ZqkYwluiIOYC9T+36aek86bZoj/qHex4HJiZyaGNdl4bJyRfN+TcQWmzXxjRexuBwRM
	WLm04U6vczXPp7cAIVbA2VBy8WiUQaCxlUZwqUxzkH08CbQS6o+3JwuWZ3zbzNwRfekEOgU
	RGf/U9dC3CJG6w+HWDKkpTl+y4zg2fva/6rVzSGGQVgrC6oJgpUmpsYZOT9QrDP86/fvste
	qoRp
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_005346_617752_A56A8D94 
X-CRM114-Status: GOOD (  17.89  )
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

On Sun, Sep 28, 2025 at 03:49:14PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
> On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > 
> > Document the compatible string for the MusePi Pro [1].
> > It is a 1.8-inch single board computer based on the
> > SpacemiT K1/M1 RISC-V SoC [2].
> you could wrap at slightly more characters, I remember 72 chars
> (haven't spent time to find a formal document link..)
Get it. Thansk.
> 
> > 
> > Link:
> > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
> I'd suggest to list core features of this board, while using this link as a complement,
> base on previous experience, vendor may change the link address, thus the link vanish
I see. Thanks for pointing it out.

> 
> > [1]
> > https://www.spacemit.com/en/key-stone-k1 [2]
> > 
> pleae keep them in one line, no break, and no blank line between SoB,
> something as below
> Link: https://.. [1]
I will. Thanks.

                - Troy
> 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
> > --- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> > @@ -22,6 +22,7 @@ properties:
> >            - enum:
> >                - bananapi,bpi-f3
> >                - milkv,jupiter
> > +              - spacemit,musepi-pro
> >                - xunlong,orangepi-rv2
> >            - const: spacemit,k1
> >  
> > 
> > -- 
> > 2.51.0
> > 
> 
> -- 
> Yixun Lan (dlan)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

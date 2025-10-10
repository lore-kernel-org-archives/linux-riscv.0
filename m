Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E7DCCA476
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 08:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUD2XVAWQRKKMxwmH+golD0HhNDM2PcWASYN1LeaqS0=; b=3rbPl0F6VOPuT1
	gj5LW7/OmrgoFPXlgqUjqPWMSziM+WmnFZRLQEihc1mpaFXeettuUt6FxDv1qZDmGlqI6+k8p2NMb
	96mV9sGdLJbZoud5isxHxIopcZAf4QFAkxkBZRafSX6M88cR4i2IJKb/eAfWyG/87MM5iKfHKrAfF
	Lv1SDpjbwPYGC5gLI4kRneS5RCjuxNOZBmj4bGDQUSxK0pvnmpFF1h3NzUBxjvmisX3soZYU9kzxa
	3itjfL5NOVVLUWYn73ua/cjaV+2s22L9/nYaBH7bE1mMZj5llv5gN0mJDZfJrm8OPgR7ccnLDApZx
	cbsZDMZr2SbgF8Dq8jmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v783W-00000007vS6-109w;
	Fri, 10 Oct 2025 08:00:50 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v783T-00000007vM4-13j9
	for linux-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 08:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760083177;
	bh=ryvk948G0hUwxcIpgCWYVy6VTTNrOofkr8sQj/xcotg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=fAfuiWXryAsBws33WvNOrUmqDhNrPcCOe83tqvdmvIN4CCFVQkcfdLUfWRhmDIX+z
	 23pargvdgNRDRFLIcUNiGGwyVv8aatOO3zOoFd9cez8TOjLzi0lnItXD75PcmU+dBr
	 /yQXXJ2H1Z+Gs8OVbqRjw49fv2G3KvGyJe90IHew=
X-QQ-mid: zesmtpsz3t1760083166t0a669ca3
X-QQ-Originating-IP: gaJRMR9DaScPqBBUF2mdYPW3jpEyOXAsEiDReItSkZU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 15:59:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8123199727091169635
EX-QQ-RecipientCnt: 15
Date: Fri, 10 Oct 2025 15:59:24 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
Message-ID: <911EFAEEDC29225C+aOi83IaxlWmKdoSc@kernel.org>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
 <59657BBB86F7B678+aOilnA5Z-QL7xF9O@kernel.org>
 <20251010064310-GYA1439398@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251010064310-GYA1439398@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nipc251ay11cV0cI9jOdPrSBXI8TYSYji4HxrO1jh7i2jWUK6I0Y1Q0u
	9C0bRRft0DgPLau1jiq1YChsBmotpy0UYSaDAdW7ZbEvWjstofQ8MZ94aHAgyF7wD2P4e8L
	UHo+ilP4M636fSBwP8oJiezgrUXrH97t1qsUquM41LTHnmNlzRUeZ37fb2Qpm2Q3sMRx9HO
	jAW75vCJvwaWyD8Li+a3rDnbaqZO1rGfGFkKt4n2BpyO9rSAEh4dgRzZYLfK65tQ6Zg993y
	F0cH+tua6P2k8T3Oyr8lMzBBLHnXBFp1oxQdi7yfnIDCfVrayqWAbhmL0O4QsX7gHeqVg1J
	9puE2al3/VptxWDwVOZO+pQHIsrLTvV2hjBOrMjnUWiT1ZS1lVB/Ym+OlMa7KVltmNld7Nh
	TJg8Tg5xv0Q85lTd7dIDLP1cjNg+1cEfaCIiDitBHThGgx89dIggiASwGg9JwWUeB/UJpjG
	9zexVhi2Hko5v/G+8k5hD3kQG7VZRHoOkwsxADXABeHvRi8d9S1QbQgld9BekHv6a8CFiyP
	fDZ5WHALucUPdYbX25Vc+YDN0UTEXhK1hqerLu6mujwG+NFtYd0QTTE7dp/e+oyNljcFz0I
	ZQdPZ1qT/WlCzKipZ2pVjg9HblrvlTBUPQDDKqbBv4Y2NKvs7ODg/P0aKdgQwmIq5WpGfdm
	Dh/J2lj6GPoyxHvtcNEIQOuUdQqI43xT60nZWrd1zpscrlNKNIhFB5BC+x7sZ70ZsXxX6YW
	eEDPcKMUJZ3y7141rcjeZr8BGyfPZ9HMGBBBV2EJoDA7SlGu9QJf12bmd8hxWm33vJmQnkB
	i44cYrzFcRBHPKnLxhHgS1QSxARzTNjD93PVGUlUmbMpJad47NRxUDIx3bfT2tigwLrmfYt
	TSfhRYuJPhGRiWJjITTxws4itYro24WHEkVLpg5oRvtDvZbaoqaNKIbyADLyfnPJWEXNzUV
	q0LMbDmgBzl/Xl88rCxzXzsuActPtsHc7GMtAnRG/optMpm2aXDugf82gjVAmxsfH8kd5wz
	mMR7hHYYg3mJDuGrbnII6+P+C/Wdvs0qnGqU7/iqodm9pfNHHTTvUuRS1i0tvbG1LcUA/Wn
	A==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_010047_738576_B5CBABBA 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, Oct 10, 2025 at 02:43:10PM +0800, Yixun Lan wrote:
> Hi Troy, Vivian:
> 
> On 14:20 Fri 10 Oct     , Troy Mitchell wrote:
> > On Fri, Oct 10, 2025 at 02:13:31PM +0800, Vivian Wang wrote:
> > > 
> [snip]..
> > > 
> > > Maybe Yixun can chime in about this as well.
> > We have talked here [1]
> > 
> > Personally, I think splitting them makes the commit history clearer.
> > I'm happy to merge them if others also think it's more appropriate.
> > 
> I do not have strong preference, either way is fine for me
> If you plan to split the DT into fine patches, then go ahead
Thank you for your reconfirmation

                    - Troy
> 
> -- 
> Yixun Lan (dlan)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

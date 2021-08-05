Return-Path: <SRS0=4geo=M4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240F5C4338F
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:54:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D63B660F01
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Aug 2021 18:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D63B660F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VzXuIrs5wKwFlnBzsDXp/qAj7eQwOFworQxmtj0haro=; b=r8zwuSZlC+FU91
	C1X3/k6IGAYIt8cgH4TAiCj39x259Btn5jcCgSxSvYRzTjOCodDRF5FcaqnKslub3/ePa352Fr8SN
	EiqZuxWUS0Vstjyls1aD9uqB3WNIVwG0ZyugB6net2IJtGGe+V02fNYQlIUG7GAcf8rK0PLcDj/ZZ
	Xm+9Vi7MCWkT7/te2VE9DUrzMFs+H9RCwbC4IX/DLMH5dN5GGr/sU7qUAzgiAAazLR52kaZ/ct2vP
	6W+/9906dk/A3RG7ANhvaZbiePXQxIhSSS3whRg2Z/lL1yqpLrhqeVyAgXnBqclB09GoauYmDeKoH
	JKGRF1agbPki/4z+U3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBiVo-00AZ4K-O2; Thu, 05 Aug 2021 18:54:36 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBiVl-00AZ2i-QD
 for linux-riscv@lists.infradead.org; Thu, 05 Aug 2021 18:54:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id n12so7873405wrr.2
 for <linux-riscv@lists.infradead.org>; Thu, 05 Aug 2021 11:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mCmxN128wN048rQ3mL+tGyaLgz6ahBPx10bueA4yYQQ=;
 b=GOrV3VP+r8pYdlSiWQTpaesHdYyjntzU0PvvHrN5y3GEyAm/V0Gk6/Q2DVPAjUOuHG
 cg9PKnXKTT6euec26ur9UeGp7ZJ1lMFf0XKNZ8JHvT1V9wtuX3S5sCHtymzoXEU9qj2q
 qvrLHR5Nn9+CzXn368JWDViQsPx0sYdfYo81GedinLwzH0j/KWAgMJ76cgcFRANa52Ap
 k/HeuXbl/H4MM5n9iS0qwck3lV1RsVGsi6ht6u6CHCiFHc0J5dQij11Gxp4rS/NpUOOz
 xuYYqbl/V2ElVpVt72G3YEr+BRDilwSbeYw+9JCFvZusmxJWVls+zLhfdxvvorH6XeKQ
 WnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mCmxN128wN048rQ3mL+tGyaLgz6ahBPx10bueA4yYQQ=;
 b=O2cd8VVdWj/AbFMJbXJJt6krUd/sLjjK4OE6FKzozTSzj9/Ddm0lAE96fuhH67+3PQ
 LGfU+GVnahW7TtRCdALNmoPOo0l5y8cdROKE0fjBESmIiJoxrlXUaq5p4CjWvbDw2JPB
 Cxmow8KQEnVeeOW7YB2282VHXs2OvjQ9mpyzO6vm6AW6ZZdSFo7cQJipKCy5U2nAC3BO
 dDyx/dYAF4GKPVYwix1B0trBA9p0ghvfSxV/8o//kK46GVsNMxJ9VjtwHh25XfJv3NH5
 kIV3vJlH73zEdkz5mcCPwLwHD8BRwa1CQr2BZngvdbJnXkkeSZ8weTR33rl3yxXLR5z+
 4hJg==
X-Gm-Message-State: AOAM532JZjxswF3qVkXtCmzoi+gQWYOtlQ4ODhXavXV7iLSJ+X12N8we
 yaamGhe5Lu15upA6pWaSL9SnWA==
X-Google-Smtp-Source: ABdhPJwssE+mX4OXOdITg+L7JFPUjj2TqXmuwypTLByy6roZIhynzabMmSfypihLZgWIBDpfU85saA==
X-Received: by 2002:a5d:5906:: with SMTP id v6mr6899987wrd.194.1628189670642; 
 Thu, 05 Aug 2021 11:54:30 -0700 (PDT)
Received: from google.com ([109.180.115.228])
 by smtp.gmail.com with ESMTPSA id p5sm7799843wrd.25.2021.08.05.11.54.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 11:54:30 -0700 (PDT)
Date: Thu, 5 Aug 2021 19:54:27 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@synopsys.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 John Crispin <john@phrozen.org>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rich Felker <dalias@libc.org>, "David S . Miller" <davem@davemloft.net>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Sebastian Reichel <sre@kernel.org>,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 1/3] arch: Export machine_restart() instances so they can
 be called from modules
Message-ID: <YQwz4xkuxvfrCnag@google.com>
References: <20210805075032.723037-1-lee.jones@linaro.org>
 <20210805075032.723037-2-lee.jones@linaro.org>
 <20210805173625.GH6719@arm.com> <YQww08x2whx/LIIT@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQww08x2whx/LIIT@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_115433_884635_17F873F7 
X-CRM114-Status: GOOD (  16.56  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAwNSBBdWcgMjAyMSwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgoKPiBPbiBUaHUs
IEF1ZyAwNSwgMjAyMSBhdCAwNjozNjoyNVBNICswMTAwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6
Cj4gPiBPbiBUaHUsIEF1ZyAwNSwgMjAyMSBhdCAwODo1MDozMEFNICswMTAwLCBMZWUgSm9uZXMg
d3JvdGU6Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMgYi9h
cmNoL2FybTY0L2tlcm5lbC9wcm9jZXNzLmMKPiA+ID4gaW5kZXggYjRiYjY3ZjE3YTJjYS4uY2Y4
OWNlOTFkNzE0NSAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvcHJvY2Vzcy5j
Cj4gPiA+ICsrKyBiL2FyY2gvYXJtNjQva2VybmVsL3Byb2Nlc3MuYwo+ID4gPiBAQCAtMjEyLDYg
KzIxMiw3IEBAIHZvaWQgbWFjaGluZV9yZXN0YXJ0KGNoYXIgKmNtZCkKPiA+ID4gIAlwcmludGso
IlJlYm9vdCBmYWlsZWQgLS0gU3lzdGVtIGhhbHRlZFxuIik7Cj4gPiA+ICAJd2hpbGUgKDEpOwo+
ID4gPiAgfQo+ID4gPiArRVhQT1JUX1NZTUJPTChtYWNoaW5lX3Jlc3RhcnQpOwo+ID4gCj4gPiBT
aG91bGQgd2UgbWFrZSB0aGlzIEVYUE9SVF9TWU1CT0xfR1BMPyBJIHN1cHBvc2UgaXQncyBub3Qg
Zm9yIGdlbmVyYWwKPiA+IHVzZSBieSBvdXQgb2YgdHJlZSBkcml2ZXJzIGFuZCBpdCBtYXRjaGVz
IHRoZSBvdGhlciBwbV9wb3dlcl9vZmYgc3ltYm9sCj4gPiB3ZSBleHBvcnQgaW4gdGhpcyBmaWxl
Lgo+IAo+IFllcyBwbGVhc2UuCgpTdXJlLgoKVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suCgotLSAK
TGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBT
ZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MK
Rm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

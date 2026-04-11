Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCAEF3ED58
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Apr 2026 16:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66r5p8g1sufOyZnuaU58Jftk8C8gbIRZAiiSwyfhcbM=; b=ZOfLKQLRrDA2Kl
	Q+WveAPrmvSIGLl8A9Iwwl75DkK1JIJMUUO0izSxlNmgaRHJDrcnKQ/O9R8pTcEvpp1o/NjsiEhjo
	CIolCoCVk/MwZrGXzbbztqCNj0J4mkmtRwFCF6k3dWBSq564Ld+8c+PjvOXZChD4+tezR0ZP27sg9
	vRWbCG9T+YRfrNWS732RORopBA9kKAofuojOHLZToUV8gQjFeLmnYh8bRSDW2hJIFw6jHJMkrZJrQ
	znqXUyeGbl0kvSJ2pyP3g/y0ccO86X93GyUF8AOeg8F2evIlsMwl8XjPvWSZIevZLCereaSnLQUKI
	aQ6ir7Z+w/m3TyH06Crw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ3-0000000DeIK-26Mw;
	Sat, 11 Apr 2026 16:52:09 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBbZ0-0000000DeHJ-1cfl
	for linux-riscv@lists.infradead.org;
	Sat, 11 Apr 2026 16:52:08 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7d556c1a79eso4291620a34.3
        for <linux-riscv@lists.infradead.org>; Sat, 11 Apr 2026 09:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775926325; cv=none;
        d=google.com; s=arc-20240605;
        b=RigS2VsA7DHcd/ZNjbmKY9XKcufz/nKab7mxfkuAK389/Jev6T1ypn8tpkh8fZQaA9
         dlf3MBVxkFlSFIkqEPnZr2U5Uk15NpP52vckazXkj1jM4dyIDFd52rPxyFKw1eIstQ+F
         SH+/7d6vUTCM2s6/VaJ0jbb9wHKhlYJp/ALoSH4RdnDqihy95o7c2hnk3sfw8ghA5BPg
         bqE9g9INptI+B2NsTOixiPPOOO12paH09YO2wYwcBdjmRM7PuaKZVpQvZVt/9xEoKRXE
         8IFUc0JTzKMAxN+WSpSM0fsctaAwmovYT3lPMlWN/AckMqp3SZh31z9l2p8esE6Xfxx5
         L2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wqSJZdgJoODeu8kv1hRE+cGfzsSFkA9szelcDJzZHDc=;
        fh=syR1FRruRO4aN6M7zWc/cFfFYuDUsP98922aBWSZzFg=;
        b=Zu7UOtG4jVt1CTGY+L5El8fO94kRcjUhaXzIFp3xYV+Wmwn9ND3WEy6DU+xm8voqF+
         7O1sjeIrJr2FgAzZApHttY7si9dfzK9ekLes8UmcObKEh9PcSkOpX0KI35ncW71YZzgu
         H9M3pq7gPZKS2TVcCmQ0oGQciDneyG+90qupRaP/ZK/WL/YCQlExyfEgdh+cC1LXCpkW
         FTh5wZKqRXCttsM598wvKGtwLb3p7827j3Oe4Z1oe4S0GI/ZkwrguoKSqfPUyzKchbCV
         I2496V8CbrMmpxLIVRAp9NC9z0e2AoOlnGTH5/SLPUYGmGzZv2v8xuCSWq03uiUmtrYH
         xFUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775926325; x=1776531125; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wqSJZdgJoODeu8kv1hRE+cGfzsSFkA9szelcDJzZHDc=;
        b=rhd8XWd1aPrb19mRpK3ROc4+KunxU+t643dFlN1GU25LiY1yR+OOo5F1+kuc1hx24h
         25UgqGIkyGjkGmW7uwaEw2Ft07WuhBkOQfYPdtIYea3ZV34BXUgmzj53S2sjG1XUoOV/
         MHV0P7o1gnbmWQkv7ABGC8n0xOtearCNt37+zKFjkfz4m1m53Xg8E26qfeEqH9r00Ggw
         form81hp57/BEUohlqb6mwm38BDs3C+1XgdIrw8BTxuAj9IPLPA2gMFYUcz3GL+Zf3aS
         gK6UbbMWibjxZDbPSWpXF1bKdNeRqsXL5AISiR79KPsdf2Yy9Kkeu1NZs+PMukwQwDf8
         +nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775926325; x=1776531125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wqSJZdgJoODeu8kv1hRE+cGfzsSFkA9szelcDJzZHDc=;
        b=khf4PrgfrJCdRiUpGa21rlVybdQJhyJ+dHm+JHLv44Z0ALAiotyEicz3lATMr647rg
         gwiwuUZtsjjhzpxRk24UW+O1FexmcgyVwRKMX9GNWihpQphuYxKu4M6qoxFZ00UD3M2+
         swoLTIG6yORLBwVShyCeZ5QGJgdS9Qmi35ntASBILYpV1v0flh1I4DZhr8Znc2KHjIhC
         rzzVYUz4rajMGwSMQqcTw//J40nL0G+GleSHWtgu4j2Q9NQ6eY8vT1NciyxV61jPIsmQ
         BZIoLidcWUp1gyoNMroEVq2Nk+TmWiDqooLrwtqbKomF3eoDdYgA6/cfGGslhtHDTiy3
         vsbA==
X-Forwarded-Encrypted: i=1; AJvYcCUuelOmAIt7DjOszXJ7pdlkvt4bDmJrSX+ciFURVHgin04lHfZb9iDUkM2ioxzswc7ncFt5pcSdXsv9Sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJUq8pmiQZnbKy8Jk++YGguXJPrTPARumFINvErKKxXI/D+Fvd
	fkTtAUacFwzzsRxaxL82Yfb1NE86ldxQMWlga46SUDkt+fsibgCehUoERS3j1z+y+lhoZLJ/DWU
	u9WSzpxnbzrWBJNQVsJoPkHZLNFO1hO1c9a+fqqIvzg==
X-Gm-Gg: AeBDieuS/nykRqsIqh5ri1uk/aCqvldRm8IEUZwNmS+VbPOIiVl6mngSCGzk1I6723T
	pc41qZT+L5gngViT9hlYXsXBhxfsKsOJHk1GNPM1gKtse/tp4gukNrIOS6a1B7aFjIA34guft+W
	GfiFoENYq2ETJ3NwusVswAC6FIZTyG9S3cTz+vkawmXDQroVvH4wN9N9cFD+6ztLoaKqfmRROgf
	73ys5R21Gi82NzDUvgVbeeifRfXtNJE+xheUNeh+vQ98sloJ4yivvpbcbn3I4VAe5x7eNWW6K9P
	eax0fmPBSUxceeYL5oD2PIg1JgKrmSwOCU+LP/PvYS96JSSoZetgSgMJsPwuRIwiZvrS/wTykU1
	3WbMMjAT2rqSGFf3Tt6xeO4cIa/o=
X-Received: by 2002:a05:6820:8183:b0:67e:1c67:ebd8 with SMTP id
 006d021491bc7-68be7ee1b88mr3330520eaf.40.1775926324573; Sat, 11 Apr 2026
 09:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260411022223.91029-1-fangyu.yu@linux.alibaba.com> <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260411022223.91029-3-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Apr 2026 22:21:53 +0530
X-Gm-Features: AQROBzC78r2FyJGwEr-mo33bIJuUYfyNgNHxCIGcYlLjmwSOUrGfuQso79gUj30
Message-ID: <CAAhSdy3EdaQaPpBCWj9AP0nmB4XP_ApqC6E9XMuJZuH19j3fPg@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommupt: Encode IOMMU_MMIO/IOMMU_CACHE via RISC-V
 Svpbmt bits
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com, 
	baolu.lu@linux.intel.com, vasant.hegde@amd.com, guoren@kernel.org, 
	iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_095206_578390_A69A92C0 
X-CRM114-Status: GOOD (  14.74  )
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

T24gU2F0LCBBcHIgMTEsIDIwMjYgYXQgNzo1MuKAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIHRoZSBSSVNDLVYgSU9NTVUgcGFnZSB0YWJsZSBmb3JtYXQgc3VwcG9y
dCBTdnBibXQsIFBCTVQgcHJvdmlkZXMKPiBhIHdheSB0byB0YWcgbWFwcGluZ3Mgd2l0aCBwYWdl
LWJhc2VkIG1lbW9yeSB0eXBlcy4gRW5jb2RlIG1lbW9yeSB0eXBlCj4gdmlhIFBCTVQgaW4gUklT
Qy1WIElPTU1VIFBURXM6Cj4KPiAgIC0gSU9NTVVfTU1JTyAgIC0+IFBCTVQ9SU8KPiAgIC0gIUlP
TU1VX0NBQ0hFIC0+IFBCTVQ9TkMKPiAgIC0gb3RoZXJ3aXNlICAgIC0+IFBCTVQ9Tm9ybWFsIChQ
Qk1UPTApCj4KPiBDbGVhciB0aGUgUEJNVCBmaWVsZCBiZWZvcmUgYXBwbHlpbmcgdGhlIHNlbGVj
dGVkIGVuY29kaW5nLCBhbmQgb25seQo+IHRvdWNoIFBCTVQgd2hlbiBQVF9GRUFUX1JJU0NWX1NW
UEJNVCBpcyBhZHZlcnRpc2VkLgo+Cj4gU2lnbmVkLW9mZi1ieTogRmFuZ3l1IFl1IDxmYW5neXUu
eXVAbGludXguYWxpYmFiYS5jb20+CgpMb29rcyBnb29kIGZyb20gUklTQy1WIHBlcnNwZWN0aXZl
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRz
LApBbnVwCgoKPiAtLS0KPiAgZHJpdmVycy9pb21tdS9nZW5lcmljX3B0L2ZtdC9yaXNjdi5oIHwg
OSArKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaCBiL2RyaXZlcnMvaW9t
bXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaAo+IGluZGV4IGE3ZmVmNjI2NmEzNi4uMDIwNTFiYjNj
NmU1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaAo+
ICsrKyBiL2RyaXZlcnMvaW9tbXUvZ2VuZXJpY19wdC9mbXQvcmlzY3YuaAo+IEBAIC01OCw2ICs1
OCw4IEBAIGVudW0gewo+ICAgICAgICAgUklTQ1ZQVF9HID0gQklUKDUpLAo+ICAgICAgICAgUklT
Q1ZQVF9BID0gQklUKDYpLAo+ICAgICAgICAgUklTQ1ZQVF9EID0gQklUKDcpLAo+ICsgICAgICAg
UklTQ1ZQVF9OQyA9IEJJVCg2MSksCj4gKyAgICAgICBSSVNDVlBUX0lPID0gQklUKDYyKSwKPiAg
ICAgICAgIFJJU0NWUFRfUlNXID0gR0VOTUFTSyg5LCA4KSwKPiAgICAgICAgIFJJU0NWUFRfUFBO
MzIgPSBHRU5NQVNLKDMxLCAxMCksCj4KPiBAQCAtMjM3LDYgKzIzOSwxMyBAQCBzdGF0aWMgaW5s
aW5lIGludCByaXNjdnB0X2lvbW11X3NldF9wcm90KHN0cnVjdCBwdF9jb21tb24gKmNvbW1vbiwK
PiAgICAgICAgICAgICAgICAgcHRlIHw9IFJJU0NWUFRfUjsKPiAgICAgICAgIGlmICghKGlvbW11
X3Byb3QgJiBJT01NVV9OT0VYRUMpKQo+ICAgICAgICAgICAgICAgICBwdGUgfD0gUklTQ1ZQVF9Y
Owo+ICsgICAgICAgaWYgKGNvbW1vbi0+ZmVhdHVyZXMgJiBCSVQoUFRfRkVBVF9SSVNDVl9TVlBC
TVQpKSB7Cj4gKyAgICAgICAgICAgICAgIHB0ZSAmPSB+UklTQ1ZQVF9QQk1UOwo+ICsgICAgICAg
ICAgICAgICBpZiAoaW9tbXVfcHJvdCAmIElPTU1VX01NSU8pCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcHRlIHw9IFJJU0NWUFRfSU87Cj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKCEoaW9t
bXVfcHJvdCAmIElPTU1VX0NBQ0hFKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwdGUgfD0g
UklTQ1ZQVF9OQzsKPiArICAgICAgIH0KPgo+ICAgICAgICAgLyogQ2FsbGVyIG11c3Qgc3BlY2lm
eSBhIHN1cHBvcnRlZCBjb21iaW5hdGlvbiBvZiBmbGFncyAqLwo+ICAgICAgICAgaWYgKHVubGlr
ZWx5KChwdGUgJiAoUklTQ1ZQVF9YIHwgUklTQ1ZQVF9XIHwgUklTQ1ZQVF9SKSkgPT0gMCkpCj4g
LS0KPiAyLjUwLjEKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==

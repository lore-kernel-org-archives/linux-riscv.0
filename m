Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4572D58E7D
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 08:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+Lgeoe5yQbYvOuD0uUY+paTKXLSqHiNuUPGZK9gciY=; b=4/uXuNoCBzacc7
	9202chgtePIJG6vs1nX/Qoqxnk1/WEyPLEvmk6EKhncGLVRLKqS1JgYq9HQqzqlWP0vAc/LQNm4mj
	HvfmLwoBOlrnETVfEcWML8oO8Ki9l5q3ZsXZZOVdl+wmM7wEjX46bGY2RtnF+n04vdGPRihO40ez/
	Dsx3YqzbkuVt4t3kCkVCXDGFyLo/sG/fOm2hBbZL/2YMStGRRyv5LthAbE1Er/mkijdwQiRmsVDbX
	DvoH3Rna3hKLtZfInznSLxpSFKDXFXjGELHfyi3Ivt/G8oO6kQtQwXvIrZ0j8L9RR9QXNXWbUZtQv
	tqirDJgNHG8OxPslsT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwylz-0000000CWk5-0O9L;
	Mon, 02 Mar 2026 08:37:03 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwylv-0000000CWiR-418m
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 08:37:01 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7d4be94eeacso4543316a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 00:36:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772440618; cv=none;
        d=google.com; s=arc-20240605;
        b=koe1762TzluZ3IHJxFnP0nWUc3YmjtR6M+qubPsr6RTmyPHazCaU7mHrKLbUREmWfM
         iinw0vAZRIPcAMrWbz1ARKIS/H5B8JZvi5b2PZu8Zgkyd/F2E2AJTifQM7OpiTUF00+l
         5FkRW8rAcb7JEJDsEiLEPMqJ5LcOnx50ELbum0ThxRkPPKifj7lA7n9qnEsZOqTATQmK
         gfm5JMcsznEemPkyIXDhlwwRnoPcsiRCCXmoDj57FaUVQdNNfx2SCKRCrTLbYYfYa2hr
         MKJldgsPrIRe91YZvy5LryNihlkCgOEVLEDb2dU7sKdyGOnzK8liOnAUoLyacoR3UHKl
         Uwkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qLKi8ai8IyE30Mtt9VN9pXVX/xYHa5xamiHmWLiG2yo=;
        fh=DMKy9FhzNRkow0tTRPXUa12hvQKTlaZmfQXfPtCmiNA=;
        b=iasr7lCCWBxx7mcwD1seccKYAW7s7oPnKyeN7V5/Xs5K3II3TjRPhtck0smtslEr7z
         Lr14y7qRQNuZnSlPdQiXXTfFzB45xyLej/HxkzfvQc1DF+KHZmIty5yEqC2e5AnmV1za
         RxtkqyXaQosH45S+vyf9UEQvBKMaUQdQyOYVZhzJdcmwVGPaqktP7JIUHMBPxj3Eoapl
         9YSMl1Z4l42ijh7EJvY2weAIXfc+Fgl9gIVtiHHs6Olq93PHbFPxHT7EdWhERbxEElqp
         j5raiiCnGv88Q3me2vo4dt2BVzqrJbpkEn5EtIpTIPHMy7lT8krNUM9fdwSO5DbON1Je
         +6cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772440618; x=1773045418; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLKi8ai8IyE30Mtt9VN9pXVX/xYHa5xamiHmWLiG2yo=;
        b=w7fsN/bfnSUsrQfwO4NvM9F9J4pqUJ+llcSm3pD+qqhVGej8zCKGEoEVJoGoiZ32aF
         W+sv/QojMAybSbXD8fDo64wvnSmFxgYpFroSxF8ESb1GzCGZfyX1VygZR1KXOJ86RtZ/
         Ssx0StJsrkkFHUNbkpxnv/ilDy9FnA9F0y/5vJUCZeHm2N81wey2udPTTHv/sNn0K4su
         GDrjUE6r2qVfb6HY4El6rDsvwgLMhh0H3zrOE8MxbGfFu3N00zbAmSQ8N/iztmSSh5q6
         SqzcrqZOJ2CzIkIfhcwswo13YOX7d124e1CQitX0r7j9NxrC9jJbVkv9xNga/gtlUcoN
         kt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440618; x=1773045418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qLKi8ai8IyE30Mtt9VN9pXVX/xYHa5xamiHmWLiG2yo=;
        b=c87WRbohrLm8GdFTAkT0AT9jEx/mveHAkGTGPOoFwZb/JuMWtkeAfm/STGjr0Ss+2V
         MSMgG1K+fjci29uw9yyaLjYIpOTMHNPy4Mg+PjBc5xRry8LXlXYzXPKRjlH8uKSVanpu
         duUCwbznPcOfICAjymvjE6qp+0KyvZSxXqh3vbSE5jTBYhpbfKvkVWI4kc5poolEZjfk
         CNflKKAQzsANvJz1UNVOGDXRXiWyfT/2KXO0aglfj7te1VYjHIliXGdzCUxD451KUmxb
         fT8FQsUtJwZb/q89DVZc3gSFQWZRFl4vy5i3k81hMJpRth24nSGAjgVF9+wSOfQO580c
         Fz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSWnvIBUz9lTBhWwo35A2QU6mKFeyZkxCWVLWFyD3ByMUnW52K3ElICvGm7bAPF8RujM5wM5ojaeMAfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwgE9lJ9mtb0Y4lFUGacnlBmEOC6hlM9Xo5jEEabZoQJKRrhGp5
	vAqCg7a87Ab8bfOrCtSK9E1Br9dzg1nGw2cleALmJMlPMA9qtBM3V8Mg7xIO7UbY99ZvJYlaB6K
	pxopB9LfmEGIEp+KSzcI0evPnaR/03D2R2LiKfcBA1A==
X-Gm-Gg: ATEYQzy97V5tCwE6330rrVE0Cw5MvBgkCAq8G9WysF2yCAksAsfqt6pke79d4R2gmrO
	Dklmmf/PhUA25z7up0ImZi+7g5TJzm4Yj72UcHBOR8+q5GyNC/FZGqSlgiNaPbVEsQNyeNaCPFD
	75+mvU8L/qHwoAlu1ckII7gAjagQgeq8AGMuZ7JbkwpKDq3bxeLwK6gce6rP8iP9yGO4wRSrfjz
	jnPoItJUyTOSPpeCWpZDsombMbB+NtzfFW8Soacl5vCkjhtCLLMoVuXrQI2fFi4spd19LCtCN+e
	NGzBqkLca3FkrQ0Q/S/uuUzKQRa9FmLwFCk2yZkb4xiTVvW/60OIBVUVJejEuEHN/zejj7nNIag
	rJqdI+oRc9/+bMhdNml+Lg9nvF9I=
X-Received: by 2002:a05:6820:4810:b0:679:8b1d:ba0f with SMTP id
 006d021491bc7-679faeff7c6mr5220357eaf.39.1772440618592; Mon, 02 Mar 2026
 00:36:58 -0800 (PST)
MIME-Version: 1.0
References: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260226085119.643295-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Mar 2026 14:06:46 +0530
X-Gm-Features: AaiRm51GI-DugvCRdiijwtodWGn36vtplbYEJJN6taqR6JPTEeVPaXB6mjwDWVE
Message-ID: <CAAhSdy1Ha31-bYFs2DknN00i_boP_2hyaXyqf2UQ+YypC3pefg@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_vcpu_aia_rmw_topei()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atish.patra@linux.dev>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_003659_999946_4190048C 
X-CRM114-Status: GOOD (  19.99  )
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

T24gVGh1LCBGZWIgMjYsIDIwMjYgYXQgMjoyMeKAr1BNIEppYWthaSBYdSA8eHVqaWFrYWkyMDI1
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IGt2bV9yaXNjdl92Y3B1X2FpYV9ybXdfdG9wZWkoKSBh
c3N1bWVzIHRoYXQgdGhlIHBlci12Q1BVIElNU0lDIHN0YXRlIGhhcwo+IGJlZW4gaW5pdGlhbGl6
ZWQgb25jZSBBSUEgaXMgcmVwb3J0ZWQgYXMgYXZhaWxhYmxlIGFuZCBpbml0aWFsaXplZCBhdAo+
IHRoZSBWTSBsZXZlbC4gVGhpcyBhc3N1bXB0aW9uIGRvZXMgbm90IGFsd2F5cyBob2xkLgo+Cj4g
VW5kZXIgZnV6emVkIGlvY3RsIHNlcXVlbmNlcywgYSBndWVzdCBtYXkgYWNjZXNzIHRoZSBJTVNJ
QyBUT1BFSSBDU1IKPiBiZWZvcmUgdGhlIHZDUFUgSU1TSUMgc3RhdGUgaXMgc2V0IHVwLiBJbiB0
aGlzIGNhc2UsCj4gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0ZSBpcyBzdGlsbCBO
VUxMLCBhbmQgdGhlIFRPUEVJIFJNVyBwYXRoCj4gZGVyZWZlcmVuY2VzIGl0IHVuY29uZGl0aW9u
YWxseSwgbGVhZGluZyB0byBhIGhvc3Qga2VybmVsIGNyYXNoLgo+Cj4gVGhlIGNyYXNoIG1hbmlm
ZXN0cyBhczoKPiAgIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIHBhZ2luZyByZXF1ZXN0IGF0IHZp
cnR1YWwgYWRkcmVzcwo+ICAgZGZmZmZmZmYwMDAwMDAwZQo+ICAgLi4uCj4gICBrdm1fcmlzY3Zf
dmNwdV9haWFfaW1zaWNfcm13IGFyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jOjkwOQo+ICAga3Zt
X3Jpc2N2X3ZjcHVfYWlhX3Jtd190b3BlaSBhcmNoL3Jpc2N2L2t2bS9haWEuYzoyMzEKPiAgIGNz
cl9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjIwOAo+ICAgc3lzdGVtX29wY29kZV9p
bnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjI4MQo+ICAga3ZtX3Jpc2N2X3ZjcHVfdmly
dHVhbF9pbnNuIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jOjM1NQo+ICAga3ZtX3Jpc2N2X3Zj
cHVfZXhpdCBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYzoyMzAKPiAgIGt2bV9hcmNoX3ZjcHVf
aW9jdGxfcnVuIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYzoxMDA4Cj4gICAuLi4KPgo+IEZpeCB0aGlz
IGJ5IGV4cGxpY2l0bHkgY2hlY2tpbmcgd2hldGhlciB0aGUgdkNQVSBJTVNJQyBzdGF0ZSBoYXMg
YmVlbgo+IGluaXRpYWxpemVkIGJlZm9yZSBoYW5kbGluZyBUT1BFSSBDU1IgYWNjZXNzZXMuIElm
IG5vdCwgZm9yd2FyZCB0aGUgQ1NSCj4gZW11bGF0aW9uIHRvIHVzZXIgc3BhY2UuCj4KPiBGaXhl
czogZGI4YjdlOTdkNjEzNyAoIlJJU0MtVjogS1ZNOiBBZGQgaW4ta2VybmVsIHZpcnR1YWxpemF0
aW9uIG9mIEFJQSBJTVNJQyIpCj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDx4dWppYWthaTIw
MjVAaXNjYXMuYWMuY24+Cj4gU2lnbmVkLW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRA
Z21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgZml4ZXMgZm9yIExpbnV4LTcuMC1yY1gKClJl
Z2FyZHMsCkFudXAKCj4gLS0tCj4gVjEgLT4gVjI6IE1vdmVkIGltc2ljX3N0YXRlIE5VTEwgY2hl
Y2sgaW50byBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfcm13KCkuCj4gICAgICAgICAgIFVwZGF0
ZWQgRml4ZXMgdGFnIHRvIGRiOGI3ZTk3ZDYxMzcuCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2Fp
YV9pbXNpYy5jIHwgNCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPgo+
IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYV9pbXNpYy5jCj4gaW5kZXggZmRhMDM0NmYwZWExZi4uNjA5MTdmNDc4OWQ4NCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3Zt
L2FpYV9pbXNpYy5jCj4gQEAgLTg5Miw2ICs4OTIsMTAgQEAgaW50IGt2bV9yaXNjdl92Y3B1X2Fp
YV9pbXNpY19ybXcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGlzZWwsCj4g
ICAgICAgICBpbnQgciwgcmMgPSBLVk1fSU5TTl9DT05USU5VRV9ORVhUX1NFUEM7Cj4gICAgICAg
ICBzdHJ1Y3QgaW1zaWMgKmltc2ljID0gdmNwdS0+YXJjaC5haWFfY29udGV4dC5pbXNpY19zdGF0
ZTsKPgo+ICsgICAgICAgLyogSWYgSU1TSUMgdkNQVSBzdGF0ZSBub3QgaW5pdGlhbGl6ZWQgdGhl
biBmb3J3YXJkIHRvIHVzZXIgc3BhY2UgKi8KPiArICAgICAgIGlmICghaW1zaWMpCj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBLVk1fSU5TTl9FWElUX1RPX1VTRVJfU1BBQ0U7Cj4gKwo+ICAgICAg
ICAgaWYgKGlzZWwgPT0gS1ZNX1JJU0NWX0FJQV9JTVNJQ19UT1BFSSkgewo+ICAgICAgICAgICAg
ICAgICAvKiBSZWFkIHBlbmRpbmcgYW5kIGVuYWJsZWQgaW50ZXJydXB0IHdpdGggaGlnaGVzdCBw
cmlvcml0eSAqLwo+ICAgICAgICAgICAgICAgICB0b3BlaSA9IGltc2ljX21yaWZfdG9wZWkoaW1z
aWMtPnN3ZmlsZSwgaW1zaWMtPm5yX2VpeCwKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

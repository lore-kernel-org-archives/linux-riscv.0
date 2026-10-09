Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22EFCA601D
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MT44fIt8gtvpakXVdpMAN713IEYlteD7pn2SYVTCHb0=; b=HGoBmtWXIwmbQk
	9N7G4bETKVzd+mScIM2sHABnI40j40VS4tKCMMchqwtBuzW7lWmY83EUPvN2byteRqBHwTBxgd+WL
	oo1bnA+JHSeaA5z7cNXdouqHViM8ZQNEOU+imMhU1w+ngHSH39/dCohoJ4wCfTrF10bwSZMXFRMVU
	rGRXAl1/butorAyaoFOpLXwlUFpxhSxB2G6k8UC0FguqrVqXQ2V8dn+P03SH+OLppi6qcti9g+LVg
	nfBNuiugRdXI+iKJcQWAlyYe/szcvbe3vpAV185YH2KVE1TDjlJNdHpbv/dZCJymt608lszR3BKTv
	oWebxiCu7WAnGG5mp/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDb7-00000006fdu-2rje;
	Fri, 09 Oct 2026 16:37:29 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDb4-00000006fd5-2NtL
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 16:37:28 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48c4207ac26so9497f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 09:37:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791563845; cv=none;
        d=google.com; s=arc-20260327;
        b=Zqk0kqlatK8NuSf/WB3mkQDFCBUJPwZNFGZhPGFvBTtZFzj7I6+3eSHXkiXMjMyyr2
         /SCjE7Sbq+0rwCWOoDTcFDgrsIJZl7nYdEzz1+MtSmZk6sWZxv1LtPsojCeuhuAwc/Qp
         pNtaydO7Ko690BCbA31aumiA072g0n1+xcN3a1SrqVFIp/G6eWFNrj/PcRjbCPW1LlcU
         2N1IIczlW+UidFsGbY6R9gUzRiXLOVyUeH5AwakaG1pwM69MYZL+iH0YQD+u1fLke0So
         XNwr2CyBPW6jthZfgDPGrCAWQ3AXu3xcR5l3FzeMvVZrgW1VEM1RF19s0kwv3w06Mt6I
         +WTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        fh=VCjzrThqgRsT86wTtuES5KkgJhjfQaVuT7bRfkWhyr8=;
        b=N2Ni6O42VghSRXAexM9KE3FVfOUd9cBf81kyHrgMVDVz0rMQXOq3bTs/WApu1WiWId
         5zn2czhMcy1bSTMjvmoOPEuF13OriMlv31iIdaSTRnJcIz6Lf6TjAkzKu8OS375301Pg
         9ch2ZIMBWxZw3HKnqrgqzZbjSSS16oXfNycvTFdNNedyGW6dI4yqrfUrXAavvNiJDhPO
         sEaI4v8tHmwGMcKnIEytzgRXwUk65C6GH786Jnu2geRxkDcoc87AWuE0kpDqkpMMsaJp
         4ZEY8qmTzQ8PwuPWheloxGJklJlYKNobezUxMOf2dAWSIJvjvUtKhdS5TFPRVSiB7zu7
         oTgw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791563845; x=1792168645; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        b=e/xEuQXlPUnL/zTzn0TFV35kKG2dtONXPeCRcloqGX7N70oK0EJLlk8znugnrP2cOC
         K/7EPaukJLdrdPJtHucxksYAn9WJSxywi0NQpFUoDEcBKvA2Q9YiW/FU+wXJjLYKVB1g
         v9VuGpqflcUmQRO9aI4SrH0paLKiOpDSHFx4xT4p8ixLrprDxZcUanDb/WX0XdYmFxxL
         REbxNHbxc2onW9N1EPujdOtlxT2it/K7S0pqFLyiKswdWk8UGQkn1M+aN6WWWA96Sxc2
         g0N+1s6AlBWzixRxEty410nrwk0KEcvbvinOtV5RzFBOf3EckrLyLoh/qkOPZOly0xC8
         mWxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563845; x=1792168645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcD3lWBEn/k5gS7QyncQIx9YliZr40hzwE5JijjRb3o=;
        b=0mJ0eVh/kzUAYdZafDD6122S41Wrnk8F2Iu2OWNNzwL+zYB5BfUxgAKbM4Q6eODNc5
         CcbKReXR7Yz4lpr7ergl8JfS563efx3tmIXi+s6QsAekKK5zwc9LW0eian4md9DLDk4Z
         4geO1FNFEPrbbfoD1YGBcdGTMh623wH5F3JVDCRvXJcK66wQ2M8n+4Mh3rqqo7I31UYO
         EtnFe8Yjl/W5K2azbeD3d/RuUUXdqAHw7Ho8W/+qyErFPlFxmtQvCr2q+zANliSByHNW
         yDeeUQlLUOXV+hIVgeM80NUzdkbRRN+Tzwd9QVKCnXuyZgTOSLFfvD1Htzsa79b9krVg
         2/Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxRuurk11ewFGMkXSDyov4+8KZpL1kSDAhjNbS9+yj5hUffLo/egD4RCZjgvvT9DPDobG7Ibzv6IW1WvA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJlJvMMHMGovgjWvKuxqR+7nryVPUQx84jAX96aEZXJcvuhaOxs
	t+tneITd2E/Xkuw8v2IWWeBkUAl5N/RTzG7ZnHH+b9R2oE3unDvT7rkF4ZANqsyrHhBuJkl6Y58
	qU/5hO1+BUzbhmCgOzErhzb7HBUFmjN1Ap/SwuIRMGQ==
X-Gm-Gg: AYBFou2o+v4akLFWwIjlBU/UtYXTwkbMxO+N6Ddj7NqxOTcPsoQyTkJ4822ZzGZzgp8
	foSuuHQ4Hrn/KXDVCSEAY65J15bCtZaDdkVUdOflUHKCqbiQ549euv7BjQZWfOKw2cWLbhUD7Qx
	OmOLcoFjczcZnfwgx8caFijadTDk9Wiy58/dKxYhNahm/+MEjSgv/ThuAvcY1R753SlVC9ASX6D
	0FmxAsuvGz0nw1VKILPGkex8Ex9BE+TBkb//5AJ2yi4CxAPSy34Fdc94FRy7unl3znt3XuXGqQ8
	H2NEzvmwIWGCs/X/UcRwCH3YuC6JgVL82DfwRResrHExTsGKZ0AbNBUKA1TEV4NezZylOQ4HzVP
	D0XXPn0LvfhMNNMF1LNyBH1bpXO8dZE36KdAxrzWGeXfxvna62sohWePJ0dRMIEwvKIMhXq1pag
	==
X-Received: by 2002:a05:6000:46db:b0:48c:652b:9694 with SMTP id
 ffacd0b85a97d-48dbaadd069mr3527485f8f.14.1791563844566; Fri, 09 Oct 2026
 09:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260925155116.465203-1-andrew.jones@oss.qualcomm.com>
 <CAAhSdy0Y8kQ=gsiX0QX6Ntq=fL89METhA0s7G3niBBJrHpue7A@mail.gmail.com> <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
In-Reply-To: <7zy352odf4hekcibmio3atunubffzxfcsqnn55q6sfkksnynfj@5bx263nnizdm>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 18:37:13 +0200
X-Gm-Features: AclHuK8vtPQ4aaw6JsQ85iwGdZHaeULxx6XNPczP994xQTrZFbfymhhY5wrwX9c
Message-ID: <CAAhSdy2mAs6UgTk-hbGd3DX_1242Jpy9WLnOp6kmPvVVtABWHw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Use a raw lock for IMSIC wakeup state
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: kvm-riscv@lists.infradead.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_093726_979262_F5BAA116 
X-CRM114-Status: GOOD (  14.27  )
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

T24gRnJpLCBPY3QgOSwgMjAyNiBhdCAzOjQ04oCvUE0gQW5kcmV3IEpvbmVzCjxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBIaSBBbnVwLAo+Cj4gT24gRnJpLCBPY3Qg
MDksIDIwMjYgYXQgMDE6NDU6MjBQTSArMDIwMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIEZy
aSwgU2VwIDI1LCAyMDI2IGF0IDU6NTHigK9QTSBBbmRyZXcgSm9uZXMKPiA+IDxhbmRyZXcuam9u
ZXNAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IGt2bV9yaXNjdl92Y3B1X2Fp
YV9pbXNpY19wdXQoKSBjYW4gcnVuIGZyb20gdGhlIHNjaGVkdWxlciBwcmVlbXB0aW9uCj4gPiA+
IG5vdGlmaWVyIHdoaWxlIHRoZSByYXcgcnVucXVldWUgbG9jayBpcyBoZWxkLiBUYWtpbmcgdnNm
aWxlX2xvY2ssIGFuCj4gPiA+IHJ3bG9ja190LCB0aGVyZSB2aW9sYXRlcyB0aGUgbG9ja2RlcCB3
YWl0LWNvbnRleHQgcnVsZXMuCj4gPiA+Cj4gPiA+IFByb3RlY3QgdGhlIENQVS9IR0VJIHBhaXIg
d2l0aCBhIHNlcGFyYXRlIHJhdyBzcGlubG9jay4gQWxsIHVwZGF0ZXMgdG8KPiA+ID4gdGhhdCBw
YWlyIHJldGFpbiB2c2ZpbGVfbG9jayBhbmQgdGFrZSB0aGUgbmV3IGxvY2ssIHdoaWxlIHNjaGVk
dWxlci1vdXQKPiA+ID4gdXNlcyBvbmx5IHRoZSBuZXcgbG9jayBhcm91bmQgdGhlIEhHRUlFIHVw
ZGF0ZS4gVGhpcyBrZWVwcyB0aGUgd2FrZXVwCj4gPiA+IHNldHVwIHNlcmlhbGl6ZWQgd2l0aCBW
Uy1maWxlIHB1YmxpY2F0aW9uIGFuZCByZWxlYXNlIHdpdGhvdXQgYnJpbmdpbmcKPiA+ID4gd2lk
ZXIgSU1TSUMgb3BlcmF0aW9ucyBpbnRvIGEgcmF3IGNyaXRpY2FsIHNlY3Rpb24uCj4gPgo+ID4g
SW5zdGVhZCBvZiBpbnRyb2R1Y2luZyBhbm90aGVyIGxvY2ssIHdoeSBub3QgcmVwbGFjZQo+ID4g
cmVhZF9sb2NrX2lycXNhdmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpIHdpdGgKPiA+IHdy
aXRlX2xvY2tfaXJxc2F2ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncykgaW4KPiA+IGt2bV9y
aXNjdl92Y3B1X2FpYV9pbXNpY19wdXQoKSA/Pwo+Cj4gVW5mb3J0dW5hdGVseSwgd3JpdGVfbG9j
a19pcnFzYXZlKCkgaGFzIHRoZSBzYW1lIFBSRUVNUFRfUlQgaXNzdWUsIHNpbmNlCj4gcndsb2Nr
X3QgaXMgc2xlZXBhYmxlIG9uIFJUIGluIGJvdGggbW9kZXMuCj4KCkkgYW0gbm90IGZvbmQgb2Yg
bmVzdGVkIGxvY2tpbmcsIHdoeSBub3QgY29udmVydCB2c2ZpbGVfbG9jayBpbnRvIHJhdwpzcGlu
bG9jayA/PwoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=

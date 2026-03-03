Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78805E67A6B
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 06:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFswCwcRc/PVH8GWTXARCwffY+nRa8xwn3C93ymI0sM=; b=ebPaM/Vtei94dV
	4NvXwRmLMzVMWFPCIQP3xHpyNlsCJTUQBqFSgiUY0ndalwoYM1IeBp/o32N71vhw9MA0YWm6iZuID
	TtnuIV/W3uYqFr92jBFPOJyUOhSExGZozRYragkNnyjq3kuXNW2mfCM8t+cleTekOKblWUrJVBinU
	JuQKGY/YAVZYwxcttCz+T0+lXG+sFu2ZbS8FrTP/ns339BYjdyEX4p+UZSukGXfavMkth4Bm8EoOx
	ShGqvW90vqRWB7abG+utHFXgyk79nMKh/YAxDEIcXayQAAi7DtUtXnGUjRIweZKfa1vL0tQ5Q9i1A
	gjtAwKQbWzc4E6IiZwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJUF-0000000Ecok-3Z70;
	Tue, 03 Mar 2026 06:44:07 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxJUD-0000000EcnW-266A
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 06:44:06 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6774d63d2e0so2289812eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 22:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772520244; cv=none;
        d=google.com; s=arc-20240605;
        b=BsFpGfQbWP6jcQh5hbvgCR23mwVhpL3esWZqd4qa+Id4qOd98KmW73ABvgiTaGY/zW
         RLBnEbXN73ozGMaID7F9rVrKw0AoXsKI0EKtlLwE0xzsMc3ejaLXM6fafsbY1phdqyvO
         WSq7fEwEyuNbiA1AeIuUukfmdzZNIDtIKuLlGuCRbUgXAh3S26fphnc109qJXn7G36qH
         dh6o7xpAokfQFRugfC/Lj2Vg9j0VQHAnr66bUfQVQleiB9SnZg1GDSHkSOJWJfBxRaZ/
         Anc5yS78htZkB27VSmb6f5RrplZqhFoAKbbTUUQUfdiwyE5HDuY7SMQf3Ryf2PpXrztQ
         8dDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=17EAKC40n4lK2eGFWleJRr7p+vuvkxDQ7nWIiu0qbQ8=;
        fh=7372kkZseKnAbxwSURw6wRcPlAznFxsYHJ11ZT3359g=;
        b=JddA1t0B/ZJArxthvfYk765CUpaOf/YJimPTv6fXXFFHcsxxvipVE18ZGz8b1J5Xxg
         OBM3BzN2j4h5vkZ8kpciolCvkth3V0WVshcuKJfkAfCQYt4KgJmP2Wi2bUOzQz+m3IL+
         tUwrXMHEP7CkhgrsB8It54ErPL/laHbDTKSEu+EcEWmH1jywMp7g+mlJtMGT8eqVrwD4
         hJX6UPwk5LmWxD+L6Vel1UmVtvOagwK3kBCIgUdWCdzF7FW46HVww7LuMtadJUuywu2j
         fvRBA6aePrdW6sIAExKRDSVQ+SWxPrfWlWEazw4AUYEvXFw6orXBXkSTegkExSb/dtW/
         Kgxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772520244; x=1773125044; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17EAKC40n4lK2eGFWleJRr7p+vuvkxDQ7nWIiu0qbQ8=;
        b=LpJVxz/VQnxxBN0dYDWJonyyr9ZzZgDGwXyRDKYNQ8zbx/yUmJ42VrVoU9SeO060nD
         GEWgJlCV3aDt6IWZ0c1UjGXPboJe5/cea3s7t00LzDM278lGJs/qh98R8getnAWUrgD9
         tXI2lvQTLhiDEOB6jcnELgJnWiqIwCYPLmMw0B7l1xCH6y2Tc6KXFWvf6VNyaKOstujp
         4GfPSg8N9zy+jQ+7wh1gMEl3ik1f51gV7TebIQrBP/Ii6Y70U+VGvKRE2aov6ztWK4GA
         ZBCrHalZ28kcooP4VqBxtKk3XWuy2Xl38Dh02iQJ56HmShXU2nGBoDS+PGgLqlg6t45k
         x6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772520244; x=1773125044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=17EAKC40n4lK2eGFWleJRr7p+vuvkxDQ7nWIiu0qbQ8=;
        b=bKPk4YzvcvntBHdAHqGG/YKFGldb7wGOl8sCzMOOuZO+e7Rbv8qwPsQIpHCdTZAvk6
         H1L3ZLoIJlgo+nb/JQHhYy682UtM3yiPkrctWp2xIeFVUbgsuePWMNbNBDuoYmIDKZpO
         zCixicvzUEZmAc0esLsDRQUr+sLHeQppoHInhKXlBs0oaOtzRxRNQSfKYaRszRvYU6CA
         LNctNzbQtsmtOoO5txROQSiNK99wMa85UxxoPx2LZdOplS1301yjxdHlDGwR6UhXgdg+
         FKKgNu8b/vxesByPl1Eto9ud4QX6qNdTGUKuoc84F6brxmCPiyAhS+l8HkB/jWGkbLDl
         M8aw==
X-Forwarded-Encrypted: i=1; AJvYcCWguLvoVxV+eIbBlGwUb0gTWxUg2XSZU7JxKi8EPAWlIyCYwEaF/nYG648Pn2ENy34XCWMezLaE1uZarQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz72WwoLIFxWZjYt0D0/F7+L7ssgeUHnSMxdewfEvi/hKl/Z8a+
	VtKZoTfYgIO3f77WUikPa3Ld4wbIB/P3kELu9RoIEPglUWM3U0V/BQ9Fy19scJgHcrrh564S+iI
	Hp+rSJ8C4fwD3HfKjjx7ZJnneYiGvkAs4hae5OKVHUg==
X-Gm-Gg: ATEYQzzN6WHS0aJTU2VEc2vfqD/Z848tClMTDEIxDhVsiHxvTnAoCDPI2ItBhyGYHnB
	tWApe1R8Qns/kpkyAvRTaIJ5QUk9nKrcMHa6R79TQ8WgrLN6ucjlVf1PgfxX0IuP1RPlxY/Ri4S
	8uDSjmbK8QqhBzFSXtiXFyq3h1JcsLbQoSRrYD0wpyeHKv5nVUoaXgrh+x1SVYLsznDkVmK+7zh
	s0XDrbdDTLjHG2mYoMKZPbfyqLzskIOMVTWoJLihpHRgISfGoUoQeSPpYOPAuuStKFkTzMpTao7
	F+5jtHFZ+EF0qfNdIMLBMlXYJ0k95axwUibj4IwhJtca8RkszGQueh9ibgT4miyPixKj7yED/hT
	1SWNVpiHm9/VJdp6j6oPf+N4QUQ==
X-Received: by 2002:a05:6820:f00a:b0:679:a47e:14cd with SMTP id
 006d021491bc7-679faefe7f6mr7620383eaf.39.1772520244125; Mon, 02 Mar 2026
 22:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20260302132703.1721415-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260302132703.1721415-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 3 Mar 2026 12:13:53 +0530
X-Gm-Features: AaiRm52W3bsHcFj5BvkAB30rof0DvdN1BKJdtWYXJgZCd2MIdieX2ABHWmNP33s
Message-ID: <CAAhSdy0RbUCD4ZQp9dVF36rE1y7__dQvKHD2RXywggn+_EU-pA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Fix use-after-free in kvm_riscv_aia_aplic_has_attr()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Atish Patra <atish.patra@linux.dev>, Jiakai Xu <jiakaiPeanut@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_224405_712186_3CD97BEC 
X-CRM114-Status: GOOD (  21.32  )
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

T24gTW9uLCBNYXIgMiwgMjAyNiBhdCA2OjU34oCvUE0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gRnV6emVyIHJlcG9ydHMgYSBLQVNBTiB1c2UtYWZ0ZXIt
ZnJlZSBidWcgdHJpZ2dlcmVkIGJ5IGEgcmFjZQo+IGJldHdlZW4gS1ZNX0hBU19ERVZJQ0VfQVRU
UiBhbmQgS1ZNX1NFVF9ERVZJQ0VfQVRUUiBpb2N0bHMgb24gdGhlIEFJQQo+IGRldmljZS4gVGhl
IHJvb3QgY2F1c2UgaXMgdGhhdCBhaWFfaGFzX2F0dHIoKSBpbnZva2VzCj4ga3ZtX3Jpc2N2X2Fp
YV9hcGxpY19oYXNfYXR0cigpIHdpdGhvdXQgaG9sZGluZyBkZXYtPmt2bS0+bG9jaywgd2hpbGUK
PiBhIGNvbmN1cnJlbnQgYWlhX3NldF9hdHRyKCkgbWF5IGNhbGwgYWlhX2luaXQoKSB1bmRlciB0
aGF0IGxvY2suIFdoZW4KPiBhaWFfaW5pdCgpIGZhaWxzIGFmdGVyIGt2bV9yaXNjdl9haWFfYXBs
aWNfaW5pdCgpIGhhcyBzdWNjZWVkZWQsIGl0Cj4gY2FsbHMga3ZtX3Jpc2N2X2FpYV9hcGxpY19j
bGVhbnVwKCkgaW4gaXRzIGZhaWxfY2xlYW51cF9pbXNpY3MgcGF0aCwKPiB3aGljaCBmcmVlcyBi
b3RoIGFwbGljX3N0YXRlIGFuZCBhcGxpY19zdGF0ZS0+aXJxcy4gVGhlIGNvbmN1cnJlbnQKPiBo
YXNfYXR0ciBwYXRoIGNhbiB0aGVuIGRlcmVmZXJlbmNlIHRoZSBmcmVlZCBhcGxpYy0+aXJxcyBp
bgo+IGFwbGljX3JlYWRfcGVuZGluZygpOgo+ICAgICAgICAgaXJxZCA9ICZhcGxpYy0+aXJxc1tp
cnFdOyAgIC8qIFVBRiBoZXJlICovCj4KPiBLQVNBTiByZXBvcnQ6Cj4gIEJVRzogS0FTQU46IHNs
YWItdXNlLWFmdGVyLWZyZWUgaW4gYXBsaWNfcmVhZF9wZW5kaW5nCj4gICAgICAgICAgICAgIGFy
Y2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjExOSBbaW5saW5lXQo+ICBCVUc6IEtBU0FOOiBzbGFi
LXVzZS1hZnRlci1mcmVlIGluIGFwbGljX3JlYWRfcGVuZGluZ193b3JkCj4gICAgICAgICAgICAg
IGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjM1MSBbaW5saW5lXQo+ICBCVUc6IEtBU0FOOiBz
bGFiLXVzZS1hZnRlci1mcmVlIGluIGFwbGljX21taW9fcmVhZF9vZmZzZXQKPiAgICAgICAgICAg
ICAgYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmM6NDA2Cj4gIFJlYWQgb2Ygc2l6ZSA4IGF0IGFk
ZHIgZmY2MDAwMDBiYTk2NWQ1OCBieSB0YXNrIDk0OTgKPiAgQ2FsbCBUcmFjZToKPiAgIGFwbGlj
X3JlYWRfcGVuZGluZyBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYzoxMTkgW2lubGluZV0KPiAg
IGFwbGljX3JlYWRfcGVuZGluZ193b3JkIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjM1MSBb
aW5saW5lXQo+ICAgYXBsaWNfbW1pb19yZWFkX29mZnNldCBhcmNoL3Jpc2N2L2t2bS9haWFfYXBs
aWMuYzo0MDYKPiAgIGt2bV9yaXNjdl9haWFfYXBsaWNfaGFzX2F0dHIgYXJjaC9yaXNjdi9rdm0v
YWlhX2FwbGljLmM6NTY2Cj4gICBhaWFfaGFzX2F0dHIgYXJjaC9yaXNjdi9rdm0vYWlhX2Rldmlj
ZS5jOjQ2OQo+ICBhbGxvY2F0ZWQgYnkgdGFzayA5NDczOgo+ICAga3ZtX3Jpc2N2X2FpYV9hcGxp
Y19pbml0IGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjU4Mwo+ICAgYWlhX2luaXQgYXJjaC9y
aXNjdi9rdm0vYWlhX2RldmljZS5jOjI0OCBbaW5saW5lXQo+ICAgYWlhX3NldF9hdHRyIGFyY2gv
cmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzozMzQKPiAgZnJlZWQgYnkgdGFzayA5NDczOgo+ICAga3Zt
X3Jpc2N2X2FpYV9hcGxpY19jbGVhbnVwIGFyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jOjY0NAo+
ICAgYWlhX2luaXQgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jOjI5MiBbaW5saW5lXQo+ICAg
YWlhX3NldF9hdHRyIGFyY2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYzozMzQKPgo+IEZpeCB0aGlz
IHJhY2UgYnkgYWNxdWlyaW5nIGRldi0+a3ZtLT5sb2NrIGluIGFpYV9oYXNfYXR0cigpIGJlZm9y
ZQo+IGNhbGxpbmcga3ZtX3Jpc2N2X2FpYV9hcGxpY19oYXNfYXR0cigpLCBjb25zaXN0ZW50IHdp
dGggdGhlIGxvY2tpbmcKPiBwYXR0ZXJuIHVzZWQgaW4gYWlhX2dldF9hdHRyKCkgYW5kIGFpYV9z
ZXRfYXR0cigpLgo+Cj4gRml4ZXM6IDI4OWEwMDdiOThiMDZkICgiUklTQy1WOiBLVk06IEV4cG9z
ZSBBUExJQyByZWdpc3RlcnMgYXMgYXR0cmlidXRlcyBvZiBBSUEgaXJxY2hpcCIpCj4gU2lnbmVk
LW9mZi1ieTogSmlha2FpIFh1IDxqaWFrYWlQZWFudXRAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IEppYWthaSBYdSA8eHVqaWFrYWkyMDI1QGlzY2FzLmFjLmNuPgo+IC0tLQo+IFYyIC0+IFYz
Ogo+IC0gRml4ZWQgaW5jb3JyZWN0IGxvY2tpbmcgcGF0dGVybiBpbiBhaWFfaGFzX2F0dHIoKTog
YXZvaWQgcmV0dXJuaW5nCj4gICB3aGlsZSBob2xkaW5nIGRldi0+a3ZtLT5sb2NrIGJ5IHN0b3Jp
bmcgdGhlIHJldHVybiB2YWx1ZSBpbiBhIGxvY2FsCj4gICB2YXJpYWJsZSwgdW5sb2NraW5nLCBh
bmQgdGhlbiByZXR1cm5pbmcuCj4gVjEgLT4gVjI6Cj4gLSBGaXhlZCB0aGUgcmFjZSBieSBhZGRp
bmcgbG9ja2luZyBpbiBhaWFfaGFzX2F0dHIoKSBpbnN0ZWFkIG9mCj4gICBpbnRyb2R1Y2luZyBh
IG5ldyB2YWxpZGF0aW9uIGZ1bmN0aW9uLCBhcyBzdWdnZXN0ZWQgYnkgQW51cCBQYXRlbC4KPiAt
LS0KPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2RldmljZS5jIHwgOSArKysrKystLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNl
LmMKPiBpbmRleCBiMTk1YTkzYWRkMWNlLi4wNzIyY2JhZWQ1ZWM5IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9kZXZpY2UuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9kZXZp
Y2UuYwo+IEBAIC00MzcsNyArNDM3LDcgQEAgc3RhdGljIGludCBhaWFfZ2V0X2F0dHIoc3RydWN0
IGt2bV9kZXZpY2UgKmRldiwgc3RydWN0IGt2bV9kZXZpY2VfYXR0ciAqYXR0cikKPgo+ICBzdGF0
aWMgaW50IGFpYV9oYXNfYXR0cihzdHJ1Y3Qga3ZtX2RldmljZSAqZGV2LCBzdHJ1Y3Qga3ZtX2Rl
dmljZV9hdHRyICphdHRyKQo+ICB7Cj4gLSAgICAgICBpbnQgbnJfdmNwdXM7Cj4gKyAgICAgICBp
bnQgbnJfdmNwdXMsIHIgPSAtRU5YSU87Cj4KPiAgICAgICAgIHN3aXRjaCAoYXR0ci0+Z3JvdXAp
IHsKPiAgICAgICAgIGNhc2UgS1ZNX0RFVl9SSVNDVl9BSUFfR1JQX0NPTkZJRzoKPiBAQCAtNDY2
LDEyICs0NjYsMTUgQEAgc3RhdGljIGludCBhaWFfaGFzX2F0dHIoc3RydWN0IGt2bV9kZXZpY2Ug
KmRldiwgc3RydWN0IGt2bV9kZXZpY2VfYXR0ciAqYXR0cikKPiAgICAgICAgICAgICAgICAgfQo+
ICAgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2UgS1ZNX0RFVl9SSVNDVl9BSUFf
R1JQX0FQTElDOgo+IC0gICAgICAgICAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X2FpYV9hcGxpY19o
YXNfYXR0cihkZXYtPmt2bSwgYXR0ci0+YXR0cik7Cj4gKyAgICAgICAgICAgICAgIG11dGV4X2xv
Y2soJmRldi0+a3ZtLT5sb2NrKTsKPiArICAgICAgICAgICAgICAgciA9IGt2bV9yaXNjdl9haWFf
YXBsaWNfaGFzX2F0dHIoZGV2LT5rdm0sIGF0dHItPmF0dHIpOwo+ICsgICAgICAgICAgICAgICBt
dXRleF91bmxvY2soJmRldi0+a3ZtLT5sb2NrKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHI7
CgpUaGlzIG5lZWRzIHRvIGJlIGEgImJyZWFrOyIgaW5zdGVhZCBvZiAicmV0dXJuIHI7Ii4KSSBo
YXZlIHRha2VuIGNhcmUgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZy4KClJldmlld2VkLWJ5OiBBbnVw
IFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUXVldWVkIHRoaXMgcGF0Y2ggYXMgZml4IGZv
ciBMaW51eC03LjAtcmNYCgpSZWdhcmRzLApBbnVwCgo+ICAgICAgICAgY2FzZSBLVk1fREVWX1JJ
U0NWX0FJQV9HUlBfSU1TSUM6Cj4gICAgICAgICAgICAgICAgIHJldHVybiBrdm1fcmlzY3ZfYWlh
X2ltc2ljX2hhc19hdHRyKGRldi0+a3ZtLCBhdHRyLT5hdHRyKTsKPiAgICAgICAgIH0KPgo+IC0g
ICAgICAgcmV0dXJuIC1FTlhJTzsKPiArICAgICAgIHJldHVybiByOwo+ICB9Cj4KPiAgc3RydWN0
IGt2bV9kZXZpY2Vfb3BzIGt2bV9yaXNjdl9haWFfZGV2aWNlX29wcyA9IHsKPiAtLQo+IDIuMzQu
MQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

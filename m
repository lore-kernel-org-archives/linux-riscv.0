Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84837C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 15:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBK5cE6MCJwRql6OAntRPtQF9EXIMUJHUWO1tZtXE5g=; b=N+8Qi5kerioFBH
	kpDQ0G59ti6uqfE8J8Bju0P5r4o0m5paown3AIA0qPlpWCHMZUVjAHq5WDYKt5Zof3m9IEX7Dm4ej
	n5MjiLtIoIyWy5aUyyglQsHVNh0ozOeCXDSxuMg8UgyfslfJCLKuA8UZXrq+a0ijVCJlQ0c4+Xbxt
	MGPLiOhvNmo18iEAAJg9vVdV5MLQ9PRX7YDpKAQki/Mial1ha+ukTvZrU7gc2n2AewwPBobSmG1uc
	miSxOd4uX5OvbGdULSdv0pe4bgS9NYdrsaaWjoVLO5frxcIbP1+s7quHAnwp0m+lJ5uef828GVU83
	N7unk4eNBB5OuG9UBEtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOVS-00GYXp-KY; Thu, 22 Sep 2022 15:52:54 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obOVO-00GYWD-HB
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 15:52:52 +0000
Received: by mail-wm1-x32c.google.com with SMTP id z13-20020a7bc7cd000000b003b5054c6f9bso1105271wmk.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 08:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date;
        bh=81X8Dd61stsBs4BxsLd4i6egkBiEzGQWkV5nRmL6aD8=;
        b=J1jMlGs02XMXXN++Af35IPh72qo3crm12S1Uz+vGYHxUUFN4wqYAmqzrFbWuYzplwq
         dXZ2Yc+GJNUHzbSpr3QXPNeRSS2m0K0wEJsXAczbh+PWwH6Jt2kIXm9TirvIRPypURmK
         88c0MAMhYg3UacE1W/7Irmhso3CjG+CXglCWObzAKZUdp5wtJo+AbYzQG7Bn+BHMzKmA
         Zf5EB8iqwKOqiWWSnrfDk8G27fgpVCU52hGZM7chRVI+pAcD3C3R98N+ZivD3xBZHXT5
         4IhlnWVD2yxB3eyyC8pWK7VrPlU6R7MQwyzJUSFP/cfo3Kvwg8b9ch8CgNMiRjJPMnhi
         ogeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=81X8Dd61stsBs4BxsLd4i6egkBiEzGQWkV5nRmL6aD8=;
        b=hCon0NwkIEuigOVHHSrR6WCmSd4eA0yGbIdd4vghUoKvSkQTAXy/ElHJrEDHzz/YV9
         zv3+eFWmxjYrCv/hOLp8LbBef0C7MY3Oyya/QMTDXNiNri7SqFxNeqho5VWHXbdx+fRr
         nt9OPxZCBvDZsB1N1MURUT9nIRi6RFlXTaQgohFOpuCroCIMr6gk2LLDLNLriykqTZSK
         ZWDqk3vchu/fQSYzNoWOgdGKHB2Q6pIMWbUJnjfdUW/iDON5cTF4s3/5zCMZ2PDgsYfk
         GXM+R9fxoZdpqXa9OXKlW5hQ0ZLd/nGWAidyiyQKzY8RXlv9yvuTNBDirKzxz5CpSNBO
         by4A==
X-Gm-Message-State: ACrzQf2pC62Of6jHW022pMQ5OxKzGtnDEj4YRAeePCyThhAZjZsH15z8
	olJjx9cxnqPq6zAzz7bDDhB122j12poDcA==
X-Google-Smtp-Source: AMsMyM4SASX+I+EOTOW+Fvp4ltwX7zDrGCp8JVHMtcMBNGTpJEfkc94AmvASPBzUQjFU5A31PsDd/Q==
X-Received: by 2002:a05:600c:4f01:b0:3b4:a8c8:2523 with SMTP id l1-20020a05600c4f0100b003b4a8c82523mr9746746wmq.199.1663861968312;
        Thu, 22 Sep 2022 08:52:48 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id m188-20020a1c26c5000000b003b47e75b401sm6148925wmm.37.2022.09.22.08.52.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Sep 2022 08:52:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [PATCH] riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <2546376.ElGaqSPkdT@phil>
Date: Thu, 22 Sep 2022 16:52:46 +0100
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Samuel Holland <samuel@sholland.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>,
 Dao Lu <daolu@rivosinc.com>,
 Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
Message-Id: <2E96A836-764D-4D07-AB79-3861B9CC2B1F@jrtc27.com>
References: <20220922060958.44203-1-samuel@sholland.org>
 <2546376.ElGaqSPkdT@phil>
To: Heiko Stuebner <heiko@sntech.de>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_085250_662022_B8148DD7 
X-CRM114-Status: GOOD (  24.50  )
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

T24gMjIgU2VwdCAyMDIyLCBhdCAxNjo0NSwgSGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5k
ZT4gd3JvdGU6Cj4gCj4gQW0gRG9ubmVyc3RhZywgMjIuIFNlcHRlbWJlciAyMDIyLCAwODowOTo1
OCBDRVNUIHNjaHJpZWIgU2FtdWVsIEhvbGxhbmQ6Cj4+IGNvbW1pdCA4ZWIwNjBlMTAxODUgKCJh
cmNoL3Jpc2N2OiBhZGQgWmloaW50cGF1c2Ugc3VwcG9ydCIpIGJyb2tlCj4+IGJ1aWxkaW5nIHdp
dGggQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFIGVuYWJsZWQgKGdjYyAxMS4xLjApOgo+PiAK
Pj4gQ0MgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92Z2V0dGltZW9mZGF5Lm8KPj4gSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIDxjb21tYW5kLWxpbmU+Ogo+PiAuL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
anVtcF9sYWJlbC5oOiBJbiBmdW5jdGlvbiAnY3B1X3JlbGF4JzoKPj4gLi8uL2luY2x1ZGUvbGlu
dXgvY29tcGlsZXJfdHlwZXMuaDoyODU6MzM6IHdhcm5pbmc6ICdhc20nIG9wZXJhbmQgMCBwcm9i
YWJseSBkb2VzIG5vdCBtYXRjaCBjb25zdHJhaW50cwo+PiAyODUgfCAjZGVmaW5lIGFzbV92b2xh
dGlsZV9nb3RvKHguLi4pIGFzbSBnb3RvKHgpCj4+IHwgXn5+Cj4+IC4vYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9qdW1wX2xhYmVsLmg6NDE6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvICdh
c21fdm9sYXRpbGVfZ290bycKPj4gNDEgfCBhc21fdm9sYXRpbGVfZ290bygKPj4gfCBefn5+fn5+
fn5+fn5+fn5+fgo+PiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5oOjI4NTozMzog
ZXJyb3I6IGltcG9zc2libGUgY29uc3RyYWludCBpbiAnYXNtJwo+PiAyODUgfCAjZGVmaW5lIGFz
bV92b2xhdGlsZV9nb3RvKHguLi4pIGFzbSBnb3RvKHgpCj4+IHwgXn5+Cj4+IC4vYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9qdW1wX2xhYmVsLmg6NDE6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1h
Y3JvICdhc21fdm9sYXRpbGVfZ290bycKPj4gNDEgfCBhc21fdm9sYXRpbGVfZ290bygKPj4gfCBe
fn5+fn5+fn5+fn5+fn5+fgo+PiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6
MjQ5OiBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3ZnZXR0aW1lb2ZkYXkub10gRXJyb3IgMQo+PiBt
YWtlOiAqKiogW2FyY2gvcmlzY3YvTWFrZWZpbGU6MTI4OiB2ZHNvX3ByZXBhcmVdIEVycm9yIDIK
Pj4gCj4+IEhhdmluZyBhIHN0YXRpYyBicmFuY2ggaW4gY3B1X3JlbGF4KCkgaXMgcHJvYmxlbWF0
aWMgYmVjYXVzZSB0aGF0Cj4+IGZ1bmN0aW9uIGlzIHdpZGVseSBpbmxpbmVkLCBpbmNsdWRpbmcg
aW4gc29tZSBxdWl0ZSBjb21wbGV4IGZ1bmN0aW9ucwo+PiBsaWtlIGluIHRoZSBWRFNPLiBBIHF1
aWNrIG1lYXN1cmVtZW50IHNob3dzIHRoaXMgc3RhdGljIGJyYW5jaCBpcwo+PiByZXNwb25zaWJs
ZSBieSBpdHNlbGYgZm9yIGFyb3VuZCA0MCUgb2YgdGhlIGp1bXAgdGFibGUuCj4+IAo+PiBEcm9w
IHRoZSBzdGF0aWMgYnJhbmNoLCB3aGljaCBlbmRzIHVwIGJlaW5nIHRoZSBzYW1lIG51bWJlciBv
Zgo+PiBpbnN0cnVjdGlvbnMgYW55d2F5LiBJZiBaaWhpbnRwYXVzZSBpcyBzdXBwb3J0ZWQsIHdl
IHRyYWRlIHRoZSBub3AgZnJvbQo+PiB0aGUgc3RhdGljIGJyYW5jaCBmb3IgYSBkaXYuIElmIFpp
aGludHBhdXNlIGlzIHVuc3VwcG9ydGVkLCB3ZSB0cmFkZSB0aGUKPj4ganVtcCBmcm9tIHRoZSBz
dGF0aWMgYnJhbmNoIGZvciAod2hhdCBnZXRzIGludGVycHJldGVkIGFzKSBhIG5vcC4KPj4gCj4+
IEZpeGVzOiA4ZWIwNjBlMTAxODUgKCJhcmNoL3Jpc2N2OiBhZGQgWmloaW50cGF1c2Ugc3VwcG9y
dCIpCj4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWxAc2hvbGxhbmQub3Jn
Pgo+PiAtLS0KPj4gCj4+IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaHdjYXAuaCB8IDMgLS0tCj4+
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaCB8IDI1ICsrKysrKysrKyst
LS0tLS0tLS0tLS0tLS0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxOCBk
ZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3
Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4gaW5kZXggNmY1OWVjNjQx
NzVlLi5iMjFkNDZlNjgzODYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
aHdjYXAuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgKPj4gQEAgLTY4
LDcgKzY4LDYgQEAgZW51bSByaXNjdl9pc2FfZXh0X2lkIHsKPj4gKi8KPj4gZW51bSByaXNjdl9p
c2FfZXh0X2tleSB7Cj4+IAlSSVNDVl9JU0FfRVhUX0tFWV9GUFUsCQkvKiBGb3IgJ0YnIGFuZCAn
RCcgKi8KPj4gLQlSSVNDVl9JU0FfRVhUX0tFWV9aSUhJTlRQQVVTRSwKPj4gCVJJU0NWX0lTQV9F
WFRfS0VZX01BWCwKPj4gfTsKPj4gCj4+IEBAIC04OCw4ICs4Nyw2IEBAIHN0YXRpYyBfX2Fsd2F5
c19pbmxpbmUgaW50IHJpc2N2X2lzYV9leHQya2V5KGludCBudW0pCj4+IAkJcmV0dXJuIFJJU0NW
X0lTQV9FWFRfS0VZX0ZQVTsKPj4gCWNhc2UgUklTQ1ZfSVNBX0VYVF9kOgo+PiAJCXJldHVybiBS
SVNDVl9JU0FfRVhUX0tFWV9GUFU7Cj4+IC0JY2FzZSBSSVNDVl9JU0FfRVhUX1pJSElOVFBBVVNF
Ogo+PiAtCQlyZXR1cm4gUklTQ1ZfSVNBX0VYVF9LRVlfWklISU5UUEFVU0U7Cj4+IAlkZWZhdWx0
Ogo+PiAJCXJldHVybiAtRUlOVkFMOwo+PiAJfQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNv
L3Byb2Nlc3Nvci5oCj4+IGluZGV4IDFlNGY4YjRhZWY3OS4uNzg5YmRiODIxMWEyIDEwMDY0NAo+
PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmgKPj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4+IEBAIC00LDMwICs0LDI1
IEBACj4+IAo+PiAjaWZuZGVmIF9fQVNTRU1CTFlfXwo+PiAKPj4gLSNpbmNsdWRlIDxsaW51eC9q
dW1wX2xhYmVsLmg+Cj4+ICNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+PiAtI2luY2x1ZGUgPGFz
bS9od2NhcC5oPgo+PiAKPj4gc3RhdGljIGlubGluZSB2b2lkIGNwdV9yZWxheCh2b2lkKQo+PiB7
Cj4+IC0JaWYgKCFzdGF0aWNfYnJhbmNoX2xpa2VseSgmcmlzY3ZfaXNhX2V4dF9rZXlzW1JJU0NW
X0lTQV9FWFRfS0VZX1pJSElOVFBBVVNFXSkpIHsKPj4gI2lmZGVmIF9fcmlzY3ZfbXVsZGl2Cj4+
IC0JCWludCBkdW1teTsKPj4gLQkJLyogSW4gbGlldSBvZiBhIGhhbHQgaW5zdHJ1Y3Rpb24sIGlu
ZHVjZSBhIGxvbmctbGF0ZW5jeSBzdGFsbC4gKi8KPj4gLQkJX19hc21fXyBfX3ZvbGF0aWxlX18g
KCJkaXYgJTAsICUwLCB6ZXJvIiA6ICI9ciIgKGR1bW15KSk7Cj4+ICsJaW50IGR1bW15Owo+PiAr
CS8qIEluIGxpZXUgb2YgYSBoYWx0IGluc3RydWN0aW9uLCBpbmR1Y2UgYSBsb25nLWxhdGVuY3kg
c3RhbGwuICovCj4+ICsJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJkaXYgJTAsICUwLCB6ZXJvIiA6
ICI9ciIgKGR1bW15KSk7Cj4+ICNlbmRpZgo+PiAtCX0gZWxzZSB7Cj4+IC0JCS8qCj4+IC0JCSAq
IFJlZHVjZSBpbnN0cnVjdGlvbiByZXRpcmVtZW50Lgo+PiAtCQkgKiBUaGlzIGFzc3VtZXMgdGhl
IFBDIGNoYW5nZXMuCj4+IC0JCSAqLwo+PiArCS8qCj4+ICsJICogUmVkdWNlIGluc3RydWN0aW9u
IHJldGlyZW1lbnQuCj4+ICsJICogVGhpcyBhc3N1bWVzIHRoZSBQQyBjaGFuZ2VzLgo+PiArCSAq
Lwo+PiAjaWZkZWYgX19yaXNjdl96aWhpbnRwYXVzZQo+PiAtCQlfX2FzbV9fIF9fdm9sYXRpbGVf
XyAoInBhdXNlIik7Cj4+ICsJX19hc21fXyBfX3ZvbGF0aWxlX18gKCJwYXVzZSIpOwo+PiAjZWxz
ZQo+PiAtCQkvKiBFbmNvZGluZyBvZiB0aGUgcGF1c2UgaW5zdHJ1Y3Rpb24gKi8KPj4gLQkJX19h
c21fXyBfX3ZvbGF0aWxlX18gKCIuNGJ5dGUgMHgxMDAwMDBGIik7Cj4+ICsJLyogRW5jb2Rpbmcg
b2YgdGhlIHBhdXNlIGluc3RydWN0aW9uICovCj4+ICsJX19hc21fXyBfX3ZvbGF0aWxlX18gKCIu
NGJ5dGUgMHgxMDAwMDBGIik7Cj4+ICNlbmRpZgo+IAo+IGhtbSwgdGhvdWdoIGJlZm9yZSB0aGlz
IHBhcnQgb2YgdGhlIGNvZGUgd2FzIG9ubHkgZXZlciBhY2Nlc3NlZAo+IHdoZW4gdGhlIHpoaW50
cGF1c2UgZXh0ZW5zaW9uIHdhcyByZWFsbHkgYXZhaWxhYmxlIG9uIHRoZSBydW5uaW5nCj4gbWFj
aGluZSB3aGlsZSBub3cgdGhlIHBhdXNlIGluc3RydWN0aW9uIGlzIGNhbGxlZCBldmVyeSB0aW1l
Lgo+IAo+IFNvIEknbSBqdXN0IHdvbmRlcmluZywgY2FuJ3QgdGhpcyBydW4gaW50byBzb21lICJp
bGxlZ2FsIGluc3RydWN0aW9uIgo+IHRoaW5neSBvbiBtYWNoaW5lcyBub3Qgc3VwcG9ydGluZyB0
aGUgZXh0ZW5zaW9uPwoKTm8uIFRoZSBlbmNvZGluZyBmb3IgcGF1c2Ugd2FzIGRlbGliZXJhdGVs
eSBjaG9zZW4gdG8gYmUgb25lIG9mIHRoZQrigJx1c2VsZXNz4oCdIGVuY29kaW5ncyBvZiBmZW5j
ZSwgd2l0aCB0aGUgaG9wZSB0aGF0IGV4aXN0aW5nCm1pY3JvYXJjaGl0ZWN0dXJlcyBtaWdodCB0
YWtlIGEgd2hpbGUgdG8gZXhlY3V0ZSBpdCBhbmQgdGh1cyBpdCB3b3VsZApzdGlsbCBmdW5jdGlv
biBhcyBhIHNsb3ctcnVubmluZyBpbnN0cnVjdGlvbi4gSXTigJlzIHNvbWV3aGF0CnF1ZXN0aW9u
YWJsZSB3aGV0aGVyIHRoZSBkaXYgaXMgZXZlbiBuZWVkZWQsIHRoZSB3b3JzdCB0aGF0IGhhcHBl
bnMgaXMKY3B1X3JlbGF4IGlzbuKAmXQgdmVyeSByZWxheGVkIGFuZCB5b3Ugc3BpbiBhIGJpdCBm
YXN0ZXIuIEFueQppbXBsZW1lbnRhdGlvbnMgd2hlcmUgdGhhdOKAmXMgdHJ1ZSBwcm9iYWJseSBh
bHNvIGRvbuKAmXQgaGF2ZSBmYW5jeQpjbG9jay9wb3dlciBtYW5hZ2VtZW50IGFueXdheSwgYW5k
IGRpdiBpc27igJl0IGdvaW5nIHRvIGJlIGEgbG93LXBvd2VyCm9wZXJhdGlvbiBzbyB0aGUgb25s
eSByZWFsIGVmZmVjdCBpcyBsaWtlbHkgaGFtbWVyaW5nIG9uIGNvbnRlbmRlZAphdG9taWNzIGEg
Yml0IG1vcmUsIGFuZCB3aG8gY2FyZXMgYWJvdXQgdGhhdCBvbiB0aGUgbG93IGNvcmUgY291bnQK
c3lzdGVtcyB3ZSBoYXZlIHRvZGF5LgoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8272EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QvGhaonlR3d4lIzkzg2VCgx9QN4BmMHpQzFn4reRblc=; b=q3d/7NFGVkmZfS
	BYInLyjJBLcvstleL4bwuSCZCumnn6O7MHeVzIkfsale8V2pcBvonYfFoMH1kVkQPXDXsTMhkIDRc
	Cah+faro1k5gP+b7DMAhLDe3d9zRcinxlegR24RPbkijMCb72chdpduO/vebWl1ayBW+Fq5ZvWa/z
	zX+Z/SpF9Z9duAKhjC5iaTfrNBDxv47i+YBCvdN4JjfYHco0XX1u4GRn7NKAUF9eAhzi9a445wA6z
	Lpv0TnZjlwe9SqiljjSfzD3GlqiA1GzG+AvnALihfvqpmkI+08y8SFLHwfzf+WbFfhL0zfex7pjtE
	1f2H4xWpDEZRY3FR6gxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4LW-002bYM-2Z;
	Fri, 15 Dec 2023 09:19:02 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4LU-002bXJ-00
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 09:19:01 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6cea5548eb2so398430b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 01:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702631938; x=1703236738; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogCR1hdsdWpS1HZE8WOgSCTe1uLlA6/5RFfX8dEYAdw=;
        b=JEUQejWmjY7Fr8Almtb+s0nWY+nyxyILrHkN3SjP4U3hLDmaTl29zgl0cmHvw9Juf7
         6yB4OhghyraT0WDzewhl3TIzajwGujBQFauNvSbCya0ypbHAhC6gSntHVHUv0gxetoQR
         7NUndgD1Qo2BdQTSxifCACLEDnTx8uOKPtvn9x4wZmFsjlWZd93nxrSmtuxdBfIzCA8k
         B3xLt7IdTQzE7D1WQPjCAmJc0gnegFkRPL6E+dGPCSoT8RlcjHasaV7XyTJss0XXoE/V
         aDaGYtTh22pwvxauw7Xlrad3QnRnu8WqQUyv5h9TfQEAEPDWo1XCJRaFLeR55+EYFM9r
         m8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702631938; x=1703236738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogCR1hdsdWpS1HZE8WOgSCTe1uLlA6/5RFfX8dEYAdw=;
        b=PnBk3AAYaPZN2+4k5Wk1IQaS7Fe6+v0ZahCt3zEvtv91KwvbgXNSOw0A/veaHc3Z8S
         F9nysgftkuAIw/k0jRuEhbX5duBEYdvCZ5x0tjXsrxpoH9Jr4vEA+IjJsXmX8zzFe+sn
         N8qzu6YKzYybVyp4cZ0Q99k2ud+xs/VJtwUqJY5P31INlHmgUCXh2VULY/VQlVOS64Tn
         sl9PCbubVeCt6c9ZVTfi4NtVfblyNSo+CWVk1yoLF7ArozZBUYYScSnA31coDdZejmVj
         FjGNDhvPqAMsVwtFIwWwe3r/ZGWe7bfGKpwH9Puouy0Vjwr6vpeS7QU2igYGv3+ZAsJs
         RDDQ==
X-Gm-Message-State: AOJu0Yz65k6j0su8q2ePBBJJPOhBQetYzJwZs3wC1J1AJIA1XjOLRqY1
	yqwwgQJzJtz2dvtSlW0oSfJW/vryCCZRnITo5oy8Zw==
X-Google-Smtp-Source: AGHT+IEHecuvvH5gisdbjy3dPL+3H8VHk5BQAOo3GiAQRSkKpe6jgUyrKDtpN/xDOgincMfaXjWTYnD9YGwNqf7qpig=
X-Received: by 2002:a05:6a20:9149:b0:18b:92b3:7c80 with SMTP id
 x9-20020a056a20914900b0018b92b37c80mr14686916pzc.22.1702631938474; Fri, 15
 Dec 2023 01:18:58 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-24-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-24-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 14:48:46 +0530
Message-ID: <CAAhSdy2P0ORPzVQCigFFQY_4vgU+5TaPnpTi7zF0-MFKJOSR6A@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] RISC-V: KVM: Implement SBI STA extension
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_011900_045508_ACD29B19 
X-CRM114-Status: GOOD (  21.98  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gQWRkIGEgc2VsZWN0IFNDSEVEX0lORk8gdG8gdGhl
IEtWTSBjb25maWcgaW4gb3JkZXIgdG8gZ2V0IHJ1bl9kZWxheQo+IGluZm8uIFRoZW4gaW1wbGVt
ZW50IFNCSSBTVEEncyBzZXQtc3RlYWwtdGltZS1zaG1lbSBmdW5jdGlvbiBhbmQKPiBrdm1fcmlz
Y3ZfdmNwdV9yZWNvcmRfc3RlYWxfdGltZSgpIHRvIHByb3ZpZGUgdGhlIHN0ZWFsLXRpbWUgaW5m
bwo+IHRvIGd1ZXN0cy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9LY29u
ZmlnICAgICAgICB8ICAxICsKPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMgfCA5NiAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDk1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vS2NvbmZpZyBiL2FyY2gvcmlzY3Yva3ZtL0tjb25maWcKPiBpbmRleCBkZmMyMzdkNzg3
NWIuLjE0OGU1MmI1MTZjZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9LY29uZmlnCj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vS2NvbmZpZwo+IEBAIC0zMiw2ICszMiw3IEBAIGNvbmZpZyBL
Vk0KPiAgICAgICAgIHNlbGVjdCBLVk1fWEZFUl9UT19HVUVTVF9XT1JLCj4gICAgICAgICBzZWxl
Y3QgTU1VX05PVElGSUVSCj4gICAgICAgICBzZWxlY3QgUFJFRU1QVF9OT1RJRklFUlMKPiArICAg
ICAgIHNlbGVjdCBTQ0hFRF9JTkZPCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgIFN1cHBvcnQg
aG9zdGluZyB2aXJ0dWFsaXplZCBndWVzdCBtYWNoaW5lcy4KPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3NiaV9zdGEuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3N0YS5j
Cj4gaW5kZXggMDczYmM0NzAxM2I3Li44YjhkYmVlNTUwMGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rdm0vdmNwdV9zYmlfc3RhLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9z
dGEuYwo+IEBAIC02LDIxICs2LDExMyBAQAo+ICAjaW5jbHVkZSA8bGludXgva2NvbmZpZy5oPgo+
ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9rdm1faG9zdC5o
Pgo+ICsjaW5jbHVkZSA8bGludXgvbW0uaD4KPiArI2luY2x1ZGUgPGxpbnV4L3NpemVzLmg+Cj4K
PiArI2luY2x1ZGUgPGFzbS9idWcuaD4KPiArI2luY2x1ZGUgPGFzbS9jdXJyZW50Lmg+Cj4gICNp
bmNsdWRlIDxhc20va3ZtX3ZjcHVfc2JpLmg+Cj4gKyNpbmNsdWRlIDxhc20vcGFnZS5oPgo+ICAj
aW5jbHVkZSA8YXNtL3NiaS5oPgo+ICsjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPgo+ICB2b2lk
IGt2bV9yaXNjdl92Y3B1X3JlY29yZF9zdGVhbF90aW1lKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkK
PiAgewo+ICAgICAgICAgZ3BhX3Qgc2htZW0gPSB2Y3B1LT5hcmNoLnN0YS5zaG1lbTsKPiArICAg
ICAgIHU2NCBsYXN0X3N0ZWFsID0gdmNwdS0+YXJjaC5zdGEubGFzdF9zdGVhbDsKPiArICAgICAg
IHUzMiAqc2VxdWVuY2VfcHRyLCBzZXF1ZW5jZTsKPiArICAgICAgIHU2NCAqc3RlYWxfcHRyLCBz
dGVhbDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgaHZhOwo+ICsgICAgICAgZ2ZuX3QgZ2ZuOwo+
Cj4gICAgICAgICBpZiAoc2htZW0gPT0gSU5WQUxJRF9HUEEpCj4gICAgICAgICAgICAgICAgIHJl
dHVybjsKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogc2htZW0gaXMgNjQtYnl0ZSBhbGln
bmVkIChzZWUgdGhlIGVuZm9yY2VtZW50IGluCj4gKyAgICAgICAgKiBrdm1fc2JpX3N0YV9zdGVh
bF90aW1lX3NldF9zaG1lbSgpKSBhbmQgdGhlIHNpemUgb2Ygc2JpX3N0YV9zdHJ1Y3QKPiArICAg
ICAgICAqIGlzIDY0IGJ5dGVzLCBzbyB3ZSBrbm93IGFsbCBpdHMgb2Zmc2V0cyBhcmUgaW4gdGhl
IHNhbWUgcGFnZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgZ2ZuID0gc2htZW0gPj4gUEFHRV9T
SElGVDsKPiArICAgICAgIGh2YSA9IGt2bV92Y3B1X2dmbl90b19odmEodmNwdSwgZ2ZuKTsKPiAr
Cj4gKyAgICAgICBpZiAoV0FSTl9PTihrdm1faXNfZXJyb3JfaHZhKGh2YSkpKSB7Cj4gKyAgICAg
ICAgICAgICAgIHZjcHUtPmFyY2guc3RhLnNobWVtID0gSU5WQUxJRF9HUEE7Cj4gKyAgICAgICAg
ICAgICAgIHJldHVybjsKPiArICAgICAgIH0KPiArCj4gKyAgICAgICBzZXF1ZW5jZV9wdHIgPSAo
dTMyICopKGh2YSArIG9mZnNldF9pbl9wYWdlKHNobWVtKSArCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVjdCBzYmlfc3RhX3N0cnVjdCwgc2VxdWVuY2UpKTsK
PiArICAgICAgIHN0ZWFsX3B0ciA9ICh1NjQgKikoaHZhICsgb2Zmc2V0X2luX3BhZ2Uoc2htZW0p
ICsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgb2Zmc2V0b2Yoc3RydWN0IHNiaV9zdGFf
c3RydWN0LCBzdGVhbCkpOwo+ICsKPiArICAgICAgIGlmIChXQVJOX09OKGdldF91c2VyKHNlcXVl
bmNlLCBzZXF1ZW5jZV9wdHIpKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAg
ICAgIHNlcXVlbmNlID0gbGUzMl90b19jcHUoc2VxdWVuY2UpOwo+ICsgICAgICAgc2VxdWVuY2Ug
Kz0gMTsKPiArCj4gKyAgICAgICBpZiAoV0FSTl9PTihwdXRfdXNlcihjcHVfdG9fbGUzMihzZXF1
ZW5jZSksIHNlcXVlbmNlX3B0cikpKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsg
ICAgICAgaWYgKCFXQVJOX09OKGdldF91c2VyKHN0ZWFsLCBzdGVhbF9wdHIpKSkgewo+ICsgICAg
ICAgICAgICAgICBzdGVhbCA9IGxlNjRfdG9fY3B1KHN0ZWFsKTsKPiArICAgICAgICAgICAgICAg
dmNwdS0+YXJjaC5zdGEubGFzdF9zdGVhbCA9IFJFQURfT05DRShjdXJyZW50LT5zY2hlZF9pbmZv
LnJ1bl9kZWxheSk7Cj4gKyAgICAgICAgICAgICAgIHN0ZWFsICs9IHZjcHUtPmFyY2guc3RhLmxh
c3Rfc3RlYWwgLSBsYXN0X3N0ZWFsOwo+ICsgICAgICAgICAgICAgICBXQVJOX09OKHB1dF91c2Vy
KGNwdV90b19sZTY0KHN0ZWFsKSwgc3RlYWxfcHRyKSk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAg
ICAgc2VxdWVuY2UgKz0gMTsKPiArICAgICAgIFdBUk5fT04ocHV0X3VzZXIoY3B1X3RvX2xlMzIo
c2VxdWVuY2UpLCBzZXF1ZW5jZV9wdHIpKTsKPiArCj4gKyAgICAgICBrdm1fdmNwdV9tYXJrX3Bh
Z2VfZGlydHkodmNwdSwgZ2ZuKTsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQga3ZtX3NiaV9zdGFfc3Rl
YWxfdGltZV9zZXRfc2htZW0oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gLSAgICAgICBy
ZXR1cm4gU0JJX0VSUl9GQUlMVVJFOwo+ICsgICAgICAgc3RydWN0IGt2bV9jcHVfY29udGV4dCAq
Y3AgPSAmdmNwdS0+YXJjaC5ndWVzdF9jb250ZXh0Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBz
aG1lbV9waHlzX2xvID0gY3AtPmEwOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzaG1lbV9waHlz
X2hpID0gY3AtPmExOwo+ICsgICAgICAgdTMyIGZsYWdzID0gY3AtPmEyOwo+ICsgICAgICAgc3Ry
dWN0IHNiaV9zdGFfc3RydWN0IHplcm9fc3RhID0gezB9Owo+ICsgICAgICAgdW5zaWduZWQgbG9u
ZyBodmE7Cj4gKyAgICAgICBib29sIHdyaXRhYmxlOwo+ICsgICAgICAgZ3BhX3Qgc2htZW07Cj4g
KyAgICAgICBpbnQgcmV0Owo+ICsKPiArICAgICAgIGlmIChmbGFncyAhPSAwKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFNOwo+ICsKPiArICAgICAgIGlmIChz
aG1lbV9waHlzX2xvID09IFNCSV9TVEFfU0hNRU1fRElTQUJMRSAmJgo+ICsgICAgICAgICAgIHNo
bWVtX3BoeXNfaGkgPT0gU0JJX1NUQV9TSE1FTV9ESVNBQkxFKSB7Cj4gKyAgICAgICAgICAgICAg
IHZjcHUtPmFyY2guc3RhLnNobWVtID0gSU5WQUxJRF9HUEE7Cj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIGlmIChzaG1lbV9waHlzX2xvICYgKFNa
XzY0IC0gMSkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfUEFSQU07
Cj4gKwo+ICsgICAgICAgc2htZW0gPSBzaG1lbV9waHlzX2xvOwo+ICsKPiArICAgICAgIGlmIChz
aG1lbV9waHlzX2hpICE9IDApIHsKPiArICAgICAgICAgICAgICAgaWYgKElTX0VOQUJMRUQoQ09O
RklHXzMyQklUKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBzaG1lbSB8PSAoKGdwYV90KXNo
bWVtX3BoeXNfaGkgPDwgMzIpOwo+ICsgICAgICAgICAgICAgICBlbHNlCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfSU5WQUxJRF9BRERSRVNTOwo+ICsgICAgICAgfQo+
ICsKPiArICAgICAgIGh2YSA9IGt2bV92Y3B1X2dmbl90b19odmFfcHJvdCh2Y3B1LCBzaG1lbSA+
PiBQQUdFX1NISUZULCAmd3JpdGFibGUpOwo+ICsgICAgICAgaWYgKGt2bV9pc19lcnJvcl9odmEo
aHZhKSB8fCAhd3JpdGFibGUpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFM
SURfQUREUkVTUzsKPiArCj4gKyAgICAgICByZXQgPSBrdm1fdmNwdV93cml0ZV9ndWVzdCh2Y3B1
LCBzaG1lbSwgJnplcm9fc3RhLCBzaXplb2YoemVyb19zdGEpKTsKPiArICAgICAgIGlmIChyZXQp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBTQklfRVJSX0ZBSUxVUkU7Cj4gKwo+ICsgICAgICAg
dmNwdS0+YXJjaC5zdGEuc2htZW0gPSBzaG1lbTsKPiArICAgICAgIHZjcHUtPmFyY2guc3RhLmxh
c3Rfc3RlYWwgPSBjdXJyZW50LT5zY2hlZF9pbmZvLnJ1bl9kZWxheTsKPiArCj4gKyAgICAgICBy
ZXR1cm4gMDsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfc3RhX2hhbmRsZXIoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+IEBAIC00Niw3ICsxMzgs
NyBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0X3N0YV9oYW5kbGVyKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgc3RydWN0IGt2bV9ydW4gKnJ1biwKPgo+ICBzdGF0aWMgdW5zaWduZWQgbG9uZyBrdm1f
c2JpX2V4dF9zdGFfcHJvYmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gLSAgICAgICBy
ZXR1cm4gMDsKPiArICAgICAgIHJldHVybiAhIXNjaGVkX2luZm9fb24oKTsKPiAgfQo+Cj4gIGNv
bnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9zdGEgPSB7Cj4g
LS0KPiAyLjQzLjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=

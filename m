Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02BAC74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 03:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOn83/tHcgwUPgI3csr2SQNgqUaic3G/Vf7S/LJmGaA=; b=ahDAO0/R2nXhRx
	F7Ng5uzkoq8F+63LCEu5juVy1zCOVNItoEduneXVs+mPVFkzmAGDJIz6AbO7wfkYxcKJcquRgxi7R
	bf4gGlVA+Sa+VQygazfZnWC8FEra7e+jLMPhiWrVFlc74KCPKRB/uouHT9ZtCGRP3Bokfoc821Z7i
	4TQY5na5vqKfVDCRSp3wPmXNHkJxGRJ+2up7PtrtSkpu+bGX8JxBlvS+I2jrbBM+6Rse7lIiP8VS/
	tUhnqrwfjXmvEDKm2kJo+wGCPXRauOPJg5YXvbfrIHV15Tm3of1RwFWEe4FY0w3UcOhLdjQlifGE5
	imENB3y+Nzz6unbIy5iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phMrZ-00GUKf-2u;
	Wed, 29 Mar 2023 03:52:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phMrX-00GUJd-1T
	for linux-riscv@lists.infradead.org;
	Wed, 29 Mar 2023 03:52:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id q19so11167662wrc.5
        for <linux-riscv@lists.infradead.org>; Tue, 28 Mar 2023 20:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1680061952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxGaqLyKO1TN0pSBe4xZ3Bl0DqqI6clzZtcK/yjTF7U=;
        b=Bg6O58r7hoxolYUP1MmFER3k3jKGZGxL4khw0OL6OElNmfbPi6G/IugpY79p8r2NQC
         Ix0IOyILyuOfKT8r1+tse0+BW5VOKD3SofIWK50yyjF1ywrvY8OcMsjZ8LXGGn2AQuKh
         7PgD69LIPjUrG1SS98FPfbhCpqqodi2fWRwda0BvQ70uKepeVqvqSxDUOdSTc49Qt0mf
         sQYFY1V+gHsec7OuksjC6rBWNtM0Yv89y6wXTFkKW/X31UHnJOHoi95A7mFLwjmzBhWp
         EoMUvqJGe8dyTgmuAi9r3TxKdWq7eW85N2jRTDGnaqKvkfD+Fw1fofX8OYvMvh3I5WvZ
         ME4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680061952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxGaqLyKO1TN0pSBe4xZ3Bl0DqqI6clzZtcK/yjTF7U=;
        b=L9FkkzCtcerzPoWw4k15py2lzvq9QrCLj6zLwlJQ3stYxjgzhi3ReoET/yX3eDZX89
         fIYfmIHz73zmI//twrkFlxg9oRHFMXI+ryxD48C5Sn8YK4R+AWzKEthTsnZ1PSpkqe25
         QfXO+ctGUug9SFe8Aacm++lrCWUmHM6OfAsiVoECg3dv5l7wwFXmJtzaIjhQgS9D0ewY
         xGiCm2yitXDnNvJnkLIr0WbMzm4PfLpDltzkRyJREPjwlBRZsFZiKOoJ7ONY7FFjgHNM
         R6qwCwj5z0Z7OxyhoLcE8G8aU2ff+D2L8GQ9848vluBqC8+afHvn+g2z9hkjmmi+3rbu
         GU8Q==
X-Gm-Message-State: AAQBX9cjVXLMM12cv/14FUmbhE9lDBHBRVmC7FWXnQqP4sBRXTamtwjC
	bhrFf60iqsVQEC7djaiAIRlKm8j+7bO5dUhlEFyGLA==
X-Google-Smtp-Source: AKy350ZJEKNgAfeLl8iFYh0WtB68/u80mVXbwZzO4ynTLgaC60l429Z+cbqfWCRLLGb09urTuZTRPLBtBV3NpOHVPk8=
X-Received: by 2002:adf:db4b:0:b0:2ce:ac97:6f51 with SMTP id
 f11-20020adfdb4b000000b002ceac976f51mr2959523wrj.13.1680061952265; Tue, 28
 Mar 2023 20:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230327115642.1610-1-cuiyunhui@bytedance.com> <d7111158-7e17-4c88-a8c1-a568db5891fa@spud>
In-Reply-To: <d7111158-7e17-4c88-a8c1-a568db5891fa@spud>
From: =?UTF-8?B?6L+Q6L6J5bSU?= <cuiyunhui@bytedance.com>
Date: Wed, 29 Mar 2023 11:52:21 +0800
Message-ID: <CAEEQ3wkKr9NhKwo0O3D=pfi80j7-cup3VgaWuk8vdk87=ryy6g@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv/fault: Dump user opcode bytes on
 fatal faults
To: Conor Dooley <conor@kernel.org>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_205239_501062_4F77AED1 
X-CRM114-Status: GOOD (  20.47  )
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

SGkgQ29ub3IsCgpPbiBXZWQsIE1hciAyOSwgMjAyMyBhdCAxOjAz4oCvQU0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKCj4gcmlzY3YvZmF1bHQ6IER1bXAgdXNlciBvcGNv
ZGUgYnl0ZXMgb24gZmF0YWwgZmF1bHRzCj4KPiBJIHRoaW5rIHlvdSBjYW4gZHJvcCB0aGUgL2Zh
dWx0LCB3ZSBkb24ndCB1c3VhbGx5IHVzZSBwcmVmaXhlcyB0aGF0IGxpa2UKPiBmb3IgUklTQy1W
Lgo+Cm9rLCBpJ2xsIHVwZGF0ZSBpdCBvbiB2MgoKCj4gPiBJbiB0aGlzIHdheSwgd2UgZm91bmQg
dGhlIHByb2JsZW06IGluIHRoZSBzeXN0ZW0gYnJpbmd1cCAsIGl0IGlzCj4gPiBwcmVjaXNlbHkg
dGhhdCB3ZSBoYXZlIG5vdCBlbmFibGVkIHRoZSBmbG9hdGluZyBwb2ludCBmdW5jdGlvbi4KPgo+
IFdoYXQgZG8geW91IG1lYW4gYnkgdGhhdCAiaGF2ZSBub3QgZW5hYmxlZCB0aGUgZmxvYXRpbmcg
cG9pbnQgZnVuY3Rpb24iPwoKVGhlIHJlbGF0ZWQgY3B1IGZlYXR1cmUoQ09NUEFUX0hXQ0FQX0lT
QV9GKSBpcyBub3QgZW5hYmxlZCBpbiB0aGUKcmlzY3ZfZmlsbF9od2NhcCBmdW5jdGlvbiBpbnRl
cmZhY2UuCgoKPiA+IFNvIHdoZW4gYW4gZXhjZXB0aW9uIG9jY3VycywgaXQgaXMgbmVjZXNzYXJ5
IHRvIGR1bXAgdGhlIGluc3RydWN0aW9uCj4gPiB0aGF0IGNhdXNlZCB0aGUgZXhjZXB0aW9uLCBs
aWtlIHg4Ni9mYXVsdCAoYmE1NGQ4NTZhOWQ4KS4KPgo+IFRoYXQncyBub3QgdGhlIHVzdWFsIGZv
cm1hdCBmb3IgcmVmZXJyaW5nIHRvIGNvbW1pdHMsIGNoZWNrcGF0Y2ggc2hvdWxkCj4gY29tcGxh
aW4gYWJvdXQgdGhhdC4KCm9rLCBpJ2xsIHVwZGF0ZSBpdCBvbiB2Mi4KCj4gPgo+ID4gTG9nczoK
PiA+IFsgICAgMC44MjI0ODFdIFJ1biAvaW5pdCBhcyBpbml0IHByb2Nlc3MKPiA+IFsgICAgMC44
Mzc1NjldIGluaXRbMV06IHVuaGFuZGxlZCBzaWduYWwgNCBjb2RlIDB4MSBhdCAweDAwMDAwMDAw
MDAwNWUwMjggaW4gYmJbMTAwMDArNWZlMDAwXQo+ID4gWyAgICAwLjkzMjI5Ml0gQ1BVOiAwIFBJ
RDogMSBDb21tOiBpbml0IE5vdCB0YWludGVkIDUuMTQuMC1yYzQtMDAwNDgtZzRhODQzYzkwNDNl
OC1kaXJ0eSAjMTM4Cj4KPiA1LjE0LXJjND8sIG9vZiEgTmVlZCB0byBnZXQgeW91cnNlbGYgb250
byBhIHJlbGVhc2VkLCBMVFMga2VybmVsIEkKPiB0aGluayEKCkp1c3QgYSBwcmludCx2Ni4zLXJj
MSBhbHNvIGhhcyB0aGlzIHByb2JsZW0uCgo+Cj4gQW55d2F5LCB0aGlzIHBhdGNoIGRvZXNuJ3Qg
YXBwbHkgdG8gZWl0aGVyIHJpc2N2L2Zvci1uZXh0LCByaXNjdi9maXhlcwo+IG9yIHY2LjMtcmMx
LiBXaGF0IGlzIHRoZSBhcHByb3ByaWF0ZSBiYXNlIHRvIGFwcGx5IHRoaXMgcGF0Y2g/Cgpvaywg
aSdsbCB1cGRhdGUgaXQgb24gdjIuCgoKPiA+IFsgICAgMC45MzYwNzNdICBzMiA6IDAwMDAwMDAw
MDAwMDAwMDAgczMgOiAwMDAwMDAwMDAwMDAwMDAwIHM0IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4g
WyAgICAwLjkzNjQ5NV0gIHM1IDogMDAwMDAwMDAwMDAwMDAwMCBzNiA6IDAwMDAwMDAwMDAwMDAw
MDAgczcgOiAwMDAwMDAwMDAwMDAwMDAwCj4gPiBbICAgIDAuOTM2OTQ3XSAgczggOiAwMDAwMDAw
MDAwMDAwMDAwIHM5IDogMDAwMDAwMDAwMDAwMDAwMCBzMTA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+
IFsgICAgMC45Mzc0ODddICBzMTE6IDAwMDAwMDAwMDBkMTQ5ODAgdDMgOiAwMDAwMDAwMDAwMDAw
MDAwIHQ0IDogMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgICAwLjkzNzk1NF0gIHQ1IDogMDAwMDAw
MDAwMDAwMDAwMCB0NiA6IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgICAgMC45Mzg1MTBdIHN0YXR1
czogMDAwMDAwMDIwMDAwMDAyMCBiYWRhZGRyOiAwMDAwMDAwMGYwMDI4MDUzIGNhdXNlOiAwMDAw
MDAwMDAwMDAwMDAyCj4KPiBJIGhhdmUgbm8gaWRlYSB3aGF0IHRoZSBzaWduaWZpY2FuY2Ugb2Yg
dGhpcyBwYXJ0aWN1bGFyIGJhY2t0cmFjZSBpcywKPiBjb3VsZCB5b3UgZWxhYm9yYXRlIG9uIHdo
YXQgdGhpcyBpcyBkZW1vbnN0cmF0aW5nPyAoYW5kIGRyb3AgdGhlIGxlYWRpbmcKPiBbIyMjXSB0
b28gYXMgaXQgZG9lc24ndCBleGFjdGx5IGFkZCBhbnl0aGluZyEKClRoZSBjdXJyZW50IGNhbGwg
dHJhY2UgZG9lcyBub3Qgc2hvdyB0aGUgaW5zdHJ1Y3Rpb24gdGhhdCBjYXVzZWQgdGhlCmV4Y2Vw
dGlvbi4gb2ssIEknbGwgcmVtb3ZlIGl0IG9uIHYyLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=

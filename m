Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97C4C4450A
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 04:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkS2mp6HsgIEOkIXB6MUF5m3s4js877a8G6z7lpnQGI=; b=KTI0nCMNDE99vQ
	+HVQCuIgguyLMqs7lFOfdQnzoyJ7+WsjuEpP5Eg5WzCP7N8XoUS1RcBtakW4NwJAyYUVe7yQcZ2MU
	SIgND+Myqx4H6oWQYfBnWpoPnfBLnivU5bgzUd41UZxnwKeVvy2jrwJrFQX7io8fjs77mK41R/XWV
	fJQplZjSXFSXQi/j/Q+pkh+usz2HdBET1WkFF8dGu7J3HtT5SijL8CPYcJv7DmsRDP/t6EJgLYtui
	RFY05b7eCg0Aoq2P0WgNE3wSdg2AKQ9oQ6VjmanEC1vO4lhwiW9EPAy+JT31sGQQYxBlPmMnDvAU/
	fyevcWNz5jFQEjgvSnRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjraV-0000000DksI-00Y1;
	Wed, 15 Jul 2026 04:51:15 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjraS-0000000Dkrw-2uvk
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 04:51:14 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-69c7ab350e9so4984653a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 21:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784091071; cv=none;
        d=google.com; s=arc-20260327;
        b=EYcZNaciEm0zakmv2UlVigQiBSEYBuEnDKw6Ti9wK08D2qdXok4H3Whbl5kyuBDJng
         nQzRh6Kuby/y8LpHt9hbsUX67zbJKA3mGIaANXJFTzPyGcSF1PtMkKonYPLCEWqsVXf/
         nr0qQCwwICdW5zcWg/IR4OR2Ni9MG2WlI99SOiihB3ycB3rGWMM+9CZfe4Y6bBo/H7pw
         ltW3w+9z9Bq9XTjrqo00MT5EGrtHIeuGcmJiEJ6rwXpzHBFHgSJpv4DroEZv2CRtGksR
         5U/1mRx2sTcyJyDTpRPEBuwrVBSGxbgtNf23QAciH9gPUQqt3EN1Rl82T440F4Y10NX1
         dJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mBgE5k0mzJhLufb2fk8ulFprL5+ykEUIw52nIQOlkI=;
        fh=XWG9yapfgvf9F0bv1W4Om4t5FKQTcRXakCXUCUEzqdk=;
        b=lPGJ4bQJFbRctB4DyBJQQ2MTQVRCyCL5SnBTnA+CTk8jLE678nWhwLtTlwMQW4blXO
         Ee48PvuNUYdJNm+NzYtGVa3dANf2ourEFojAenpR0R65nhYXcaB8ECyi3e/7JPfH9uOI
         qltlcY/htokb53xXE6YWVFTk2+3zjjphhWVKZkwwmUzFRUo+HmoxccRa2kqXBKFyLA4P
         Y8RfPXAFd/5a2iJngtsBCbcnAyNmbmeBBsuy7z4bPZwojbl0/mgX+p5K2qv6JnbZITcq
         iS0bavEEaJrXWR0ecIVantnpPIHIwhYFlGS84QRX18aOo8k9rL3xtAqxhOqCJn5lsIkN
         Mobw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784091071; x=1784695871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mBgE5k0mzJhLufb2fk8ulFprL5+ykEUIw52nIQOlkI=;
        b=crl3nS7PuIo/aspU3NVpGp8C0MB2xKxOmxCjJ4ik4xhyVKzpNnIFBRHicKyg7JFluq
         LtJGihV1a3DqzC0lTp68Dg1EafWAcRV/ybeI1eZ1TO2SBzD5r4yarJO6jUIVQ5vLXDQK
         nbYB9eGOVKATkspe8ahgVq2wJgKzROqQHvHNbqfl+/HdMspMXQ996vjydoc3t27Ai9Zs
         ROdtsWEfU+cRp+fwz0PMngl7dh95ZiuREVppU6CO8GXkQAQDWhYAITLjRr8iZGidJrru
         hmylQX8JaJVgIl7p0bDBBxyLwUjo/DCgNJf2Y3nh9BXPfTHa7IeODogp2tctRJuRMTzs
         /UxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784091071; x=1784695871;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mBgE5k0mzJhLufb2fk8ulFprL5+ykEUIw52nIQOlkI=;
        b=RvdxR0Rq2JEJIIcSm12tI8jGii3m9xS0wT8XjWHtw61WcBGMyYromx2Z6bHu/JJhG+
         fMBcx8kj1qtRtQQ0fmi0GgxU+GgejBbz4iTlE3YMy1bsFHkKM2SrNq6U+Eqohd+yml8W
         cbT3Z33O1FvSu/WXC2faRU4RDv+frMSFBIU9lYPW8Taq77sYuJ4fF1UX0DOkhPV6uxpi
         ASepj4McbR7H8mc/RxA0OWICdyT4Dj04yGapsBLhu0TO7rJQ+0SASLHvNohCanSjkPyU
         uTDDKNq/2cuXDFXUAjSOhZdDl+Od+DZSwOlZIf/ogvgt/LIe1cHAw6T/FyKFHb1H1r+E
         B/qw==
X-Forwarded-Encrypted: i=1; AHgh+RqSt8z1GMX4pP7nTWMfFzFFfffgarskWQQJg/FE1FdPWCvx9kodRInJWxVdq8yGpwA4krh35K3w4UdtJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4RKhATzACmSH3zFVe7F5MpA3GutaIBDKQdJaOa2aTonWI7tyV
	Nkmx/GhSCQ3QqICQ72QLGHnX6W/W51YIGFY4SdeceI7zFWe6ADjj2pO1pXNumFlKlgt4SHh1pdJ
	ZacsAt0GG/jkHXiFBQ8olre9HFefBTrc=
X-Gm-Gg: AfdE7cnqNmIABMAD4fIAMLdUnEnH1krV7gdP/7792lwZ0bp5k0ZGV/GCijFfBM1bIvp
	2So35dvdn/cy4SPKzv4LmFjSi8B35D63KSoyyTW5WnWHDMzQH5Z+ekRZkbfYbYjYrh5OcyoWRNM
	Lx12d7vKUmO5Q/saf+s5t9cRVO6QpdQk4hfE2D0FvgKU9cNGr40wRBDrBCYiDiGe8mM0HbDefS3
	n3TeMUUfLzOZI9vswfvXKm3jQ4SJEuRCIAmn7ogkOPnQzkNmDuXtqjUUxf2ik1/UJXxgEqbXzw/
	IstCmifJtjwrnbtJUYroLPai2pOucg==
X-Received: by 2002:a05:6402:2b86:b0:697:4fff:b90a with SMTP id
 4fb4d7f45d1cf-69e197778a7mr623073a12.4.1784091070611; Tue, 14 Jul 2026
 21:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260714223301.5265-1-shermanpauldylan@gmail.com>
 <0fcf59d9-fbf5-3f1c-910d-3e269fdadf75@kernel.org> <d20d1eca-472f-4599-925e-5a9519f674c7@iscas.ac.cn>
In-Reply-To: <d20d1eca-472f-4599-925e-5a9519f674c7@iscas.ac.cn>
From: Paul Sherman <shermanpauldylan@gmail.com>
Date: Tue, 14 Jul 2026 21:51:31 -0700
X-Gm-Features: AUfX_mwzbmcnsf_yM635QCR4ljD56j6liTOBTnI7bZh_4sn7rka7hB-sMchvmK4
Message-ID: <CALGMsBD4QKLx61gYLTBb5JokF+=EbcMxUhTYznjRiYcC6eAVEA@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: smp: set CPU 0 possible in setup_smp()
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_215112_907194_93187A39 
X-CRM114-Status: GOOD (  22.24  )
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

Vml2aWFuLCBQYXVsLAoKVGhhbmsgeW91IGZvciB0aGUgcHJlY2lzZSBhbmFseXNpcy4gWW91IGFy
ZSBjb3JyZWN0IGZvciBtYWlubGluZSwKYm9vdF9jcHVfaW5pdCgpIGNhbGxzIHNldF9jcHVfcG9z
c2libGUoMCwgdHJ1ZSkgYmVmb3JlIHNldHVwX3NtcCgpLgoKVGhlIGhhbmcgd2FzIG9ic2VydmVk
IG9uIGEgZGV2ZWxvcG1lbnQgdHJlZSBiYXNlZCBvbiBMaW51eCA3LjAtcmMyCndpdGggc3Vic3Rh
bnRpYWwgcGVyY3B1L1NMVUIgYWxsb2NhdG9yIGNoYW5nZXMgbGF5ZXJlZCBvbiB0b3AgZm9yCmxh
cmdlIE5VTUEgZ2VvbWV0cnkgKDQgbm9kZXMsIDEyOEdCKS4gSW4gdGhhdCBjb250ZXh0IEkgaW5z
dHJ1bWVudGVkCnJjdV9pbml0X29uZSgpIGFuZCByY3V0cmVlX3ByZXBhcmVfY3B1KCkgdmlhIFNC
SSBlY2FsbCBwcm9iZXMKKG5vIEpUQUcvZGVudWdnZXIgYXZhaWxhYmxlIG9uIHRoaXMgaGFyZHdh
cmUpIGFuZCBvYnNlcnZlZDoKCiAgWmEgZmZmZmZmZmY4MTAzNTAwMCAgICA8LSBwZXJfY3B1X3B0
cigmcmN1X2RhdGEsIDApIGluIHJjdV9pbml0X29uZQogIFpuIDAwMDAwMDAwMDAwMDAwMDAgICAg
PC0gbXlub2RlIHdhcyBOVUxMIGF0IHdyaXRlIHRpbWUKCiAgcmRwIGZmZmZmZmZmODEwMzUwMDAg
ICA8LSBzYW1lIGFkZHJlc3MgYXQgcmN1dHJlZV9wcmVwYXJlX2NwdQogIG15bm9kZSA9IE5VTEwg
ICAgICAgICAgPC0gY29uZmlybWVkIE5VTEwgZGVyZWZlcmVuY2UKClRoZSBmb3JfZWFjaF9wb3Nz
aWJsZV9jcHUgbG9vcCBpbiByY3VfaW5pdF9vbmUgd2FzIHNraXBwaW5nIENQVSAwCmJlY2F1c2Ug
Y3B1X3Bvc3NpYmxlX21hc2sgaGFkIG5vdCB5ZXQgYmVlbiBwb3B1bGF0ZWQgYXQgdGhhdCBwb2lu
dAppbiBteSB0cmVlJ3MgaW5pdGlhbGl6YXRpb24gb3JkZXIuIFRoZSBhZGRpdGlvbmFsIGFsbG9j
YXRvciBjaGFuZ2VzCm1heSBoYXZlIGFsdGVyZWQgdGhlIHRpbWluZy4KCkkgYW0gcmViYXNpbmcg
b250byA3LjItcmMzLiBJZiB0aGUgY29uZGl0aW9uIGNhbm5vdCBiZSByZXByb2R1Y2VkCnRoZXJl
LCBwbGVhc2UgZmVlbCBmcmVlIHRvIGRyb3AgdGhlIHBhdGNoLgoKVGhlIHByb2JlIG1ldGhvZG9s
b2d5IGFib3ZlIHVzZXMgTS1tb2RlIFNCSSBlY2FsbHMgYXMgYSBwb29yIG1hbidzCmxvZ2ljIGFu
YWx5emVyOyBoYXBweSB0byBzaGFyZSB0aGUgaW5mcmFzdHJ1Y3R1cmUgaWYgdXNlZnVsLgoKUGF1
bCBTaGVybWFuCgpPbiBUdWUsIEp1bCAxNCwgMjAyNiBhdCA5OjAx4oCvUE0gVml2aWFuIFdhbmcg
PHdhbmdydWlrYW5nQGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IE9uIDcvMTUvMjYgMDk6NDEsIFBh
dWwgV2FsbXNsZXkgd3JvdGU6Cj4KPiA+IE9uIFR1ZSwgMTQgSnVsIDIwMjYsIFBhdWwgU2hlcm1h
biB3cm90ZToKPiA+Cj4gPj4gc2V0dXBfc21wKCkgY2FsbHMgc2V0X2NwdV9wb3NzaWJsZSgpIGZv
ciBDUFVzIDEuLm5yX2NwdV9pZHMtMSBidXQKPiA+PiBuZXZlciBmb3IgQ1BVIDAgKHRoZSBib290
IENQVSkuIHg4NiBoYW5kbGVzIHRoaXMgdmlhCj4gPj4gaW5pdF9jcHVfcG9zc2libGUoY3B1bWFz
a19vZigwKSk7IFJJU0MtViBoYXMgbm8gZXF1aXZhbGVudC4KPiA+Pgo+ID4+IFdpdGhvdXQgQ1BV
IDAgaW4gY3B1X3Bvc3NpYmxlX21hc2ssIHJjdV9pbml0X29uZSgpJ3MKPiA+PiBmb3JfZWFjaF9w
b3NzaWJsZV9jcHUoKSBsb29wIHNraXBzIGl0LCBsZWF2aW5nIHJkcC0+bXlub2RlPU5VTEwuCj4g
Pj4gcmN1dHJlZV9wcmVwYXJlX2NwdSgpIHRoZW4gZGVyZWZlcmVuY2VzIE5VTEwgYW5kIGhhbmdz
Lgo+ID4+Cj4gPj4gRXhwb3NlZCBvbiBTb3BoZ28gU0cyMDQyICg2NC1oYXJ0LCA0LU5VTUEpIHdp
dGggTGludXggNy4yLXJjMy4KPiA+Pgo+ID4+IEZpeGVzOiBhNDE2NmFlYzExMzAgKCJyaXNjdjog
RGVkdXBsaWNhdGUgY29kZSBpbiBzZXR1cF9zbXAoKSIpCj4gPj4gU2lnbmVkLW9mZi1ieTogUGF1
bCBTaGVybWFuIDxzaGVybWFucGF1bGR5bGFuQGdtYWlsLmNvbT4KPiA+IFRoYW5rcywgcXVldWVk
IGZvciB2Ny4yLXJjLgo+Cj4gSSBob3BlIGl0J3Mgbm90IHRvbyBsYXRlIHRvIG9iamVjdCwgYnV0
IEkgZG9uJ3Qgc2VlIGhvdyB0aGlzIGNvdWxkCj4gaGFwcGVuLiBUaGlzIGlzIHdoYXQgaGFwcGVu
cyBpbiBzdGFydF9rZXJuZWwoKToKPgo+ICAgICBhc3NlbWJseSBib290IGNvZGUKPiAgICAgLT4g
c3RhcnRfa2VybmVsKCkKPiAgICAgICAgLT4gYm9vdF9jcHVfaW5pdCgpOwo+ICAgICAgICAgICAt
PiBpbnQgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOwo+ICAgICAgICAgICAgICAvKiBjcHUgPSAw
IGJlY2F1c2UgSU5JVF9USFJFQURfSU5GTyh0c2spIGxlYXZlcyBpdCBvdXQgKi8KPgo+ICAgICAg
ICAgICAgICAvKiBNYXJrIHRoZSBib290IGNwdSAicHJlc2VudCIsICJvbmxpbmUiIGV0YyBmb3Ig
U01QIGFuZCBVUCBjYXNlICovCj4gICAgICAgICAgICAgIHNldF9jcHVfb25saW5lKGNwdSwgdHJ1
ZSk7Cj4gICAgICAgICAgICAgIHNldF9jcHVfYWN0aXZlKGNwdSwgdHJ1ZSk7Cj4gICAgICAgICAg
ICAgIHNldF9jcHVfcHJlc2VudChjcHUsIHRydWUpOwo+ICAgICAgICAgICAgICBzZXRfY3B1X3Bv
c3NpYmxlKGNwdSwgdHJ1ZSk7IC8qIDwtLS0tIEhFUkUgKi8KPiAgICAgICAgLT4gLi4uCj4gICAg
ICAgIC0+IHNldHVwX2FyY2goJmNvbW1hbmRfbGluZSk7Cj4gICAgICAgICAgIC0+IHNldHVwX3Nt
cCgpCj4gICAgICAgICAgICAgIC0+IGZvciAoY3B1aWQgPSAxOyBjcHVpZCA8IG5yX2NwdV9pZHM7
IGNwdWlkKyspCj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNwdWlkX3RvX2hhcnRpZF9t
YXAoY3B1aWQpICE9IElOVkFMSURfSEFSVElEKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc2V0X2NwdV9wb3NzaWJsZShjcHVpZCwgdHJ1ZSk7Cj4KPiBTbyBDUFUgMCBpcyBhbHJl
YWR5IGluIGNwdV9wb3NzaWJsZV9tYXNrLiBUaGlzIGlzIGFsc28gd2hhdCBJIHNlZSBieQo+IGFk
ZGluZyBwcmludHMgdG8gc2V0dXBfc21wKCkuCj4KPiAqIFBhdWwgU2hlcm1hbjogSG93IGRpZCB5
b3UgcmVwcm9kdWNlIHRoaXM/IElzIHlvdXIgYm9vdCBDUFUgbm90IGNwdSAwCj4gKG5vdGU6IG5v
dCB0aGUgc2FtZSBhcyBoYXJ0IDApPwo+Cj4gVml2aWFuICJkcmFtZm9yZXZlciIgV2FuZwo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

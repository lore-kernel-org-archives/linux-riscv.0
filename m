Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F170CC54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 01:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P70XqszIY7m5+CjWjg2C/ogqxTiBVyRJGQFIRE3tpHc=; b=vefjRRYxhGx8Oz
	UfRxhGbzbE6HM/ZEJzjBwEYzGK/u+l1jdwIvTgSA+IGjJ6qC5YVVPh4YItt32f7l3y6UWYrBjYk6G
	jXV0zJ0vYHM1VIWy2VyOQAWRmjvbuq20hWjwAO7iVe6CN2Ls+q3RUq7SElkm4EJ48ke/ZR4cF1wNa
	79zFmtUCnNDB2okM7noK+t9N23+7ciui6kOD+iJjYK5nE/W7jXSjLVHgBK41fTGAtyJuKsdf1mCUb
	HeON4Pb+LBdcJyFJ2/4qCkaoZie9coiwkIOb2I7iS1wTiSDXqJBhCdhKl2H/ZmjrqL/1XQhA3/8CQ
	xgocD4CZHaSYHD/lUEhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrBc-00000003rkr-0G1v;
	Tue, 12 Mar 2024 01:44:12 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjrBX-00000003riw-31Gz
	for linux-riscv@lists.infradead.org;
	Tue, 12 Mar 2024 01:44:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1dda8e5fa8dso9176985ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Mar 2024 18:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1710207845; x=1710812645; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=labtf93chunomZqW/vUnTTFsyT2Ay36RYxUH/Np39t8=;
        b=V/m4gxmQdNGtbbAXe4iZ378o1kWk8lwa9l3TjDVzKeyo8ZrvdDXwWWoZvukjyohxf9
         ngYwGpGs8edFV1/CpugRTfScu2FtrSRKLCBLb13UaCfmYZkpjITAWiW/r58XtdLNNuK6
         FH2iSsiyNj1EBspd7mtbbHaRwdaCc2MvSlZgYAo8pQ6pWmwhp61OC8muc6276Mqi9jwG
         kz37v+fqxM5JD8lpDPaoWexUnFk7mbCgrGFdU8OjrkO0Zoda45GVNC7zybPHwjv10I7g
         dis2TNkw/pCb4rnF4CmIxv8ngNSPEaC2EqoS2CAKapv3s/aNzTCwt7EpewoLIqoi1+c6
         xPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710207845; x=1710812645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=labtf93chunomZqW/vUnTTFsyT2Ay36RYxUH/Np39t8=;
        b=YxiRZOYVowT3vOqOFyJfT88YLnuSpgvfb1Q3k4DW2YrJIMzwSJKZs2xeFjdAA1ycXr
         a0591V1MI2GszqL0OI3QIQAbGv4fhXjdLGokrqpTeNuflveXKQoQijCWFTQSLPZFuT9R
         T7YRSmTXaa6nFzlW4vLAY8ny0BM9h2l8bj7Gsnryaou7vQWMlumzZuPWqaoivIiQ+2qL
         2joCt1Nk0epyCqzUB6UFoMuHS+RwBMP7okuqIDQbvavz8X6gX5P8S2iHxVMesTNz/Y7k
         Vk7dxGmuQP1fiUqYwESy8c0o1hjF2lOgU+9e5QfvfrLe/cb8TSP1R9QdlAZ9OaJuJ1nH
         4dmA==
X-Forwarded-Encrypted: i=1; AJvYcCX78Mlxkc/SLlrv/onsuuhmU/qOijjmaKEBIZWhPD77hHQvJLhyVjvdmC5UJx/twENqt8mxfzP4DCARW64IboPJIGzw/RWHcBABf/ouya07
X-Gm-Message-State: AOJu0YzJVZLImoZTzbUMZZrdgb1VoQhOrVKR/jv0q9TFBqiUBskqTUsS
	4ZP26ODPFP3SIun3uDLa+3K5sqaraCIf75/S6lNIUX2qk8/j6iPxeBcCGU16B3URjbN1WIPS38V
	fE/j4vQCaJHHONNxZhc5sLcOlLlzXtuIu1H33cw==
X-Google-Smtp-Source: AGHT+IErV3iMJSVZsOorpKVzsGY2UytkCGuC6pmqJE2LbhhD8namNE+eDxsMMlkkIxKkEYQlxwMbWYmXWufoMcMT79A=
X-Received: by 2002:a17:90a:8991:b0:29b:aee2:cc8f with SMTP id
 v17-20020a17090a899100b0029baee2cc8fmr6097802pjn.9.1710207845560; Mon, 11 Mar
 2024 18:44:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240311093526.1010158-1-dongmenglong.8@bytedance.com>
 <20240311093526.1010158-9-dongmenglong.8@bytedance.com> <e8f37842-1ddf-4241-97f3-b83ffcb32ddc@isovalent.com>
In-Reply-To: <e8f37842-1ddf-4241-97f3-b83ffcb32ddc@isovalent.com>
From: =?UTF-8?B?5qKm6b6Z6JGj?= <dongmenglong.8@bytedance.com>
Date: Tue, 12 Mar 2024 09:43:54 +0800
Message-ID: <CALz3k9hDuUgT0bQWXRKVogJ9=UF0_zWu6dAJVYE380BHBy85JA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH bpf-next v2 8/9] libbpf: add support for
 the multi-link of tracing
To: Quentin Monnet <quentin@isovalent.com>
Cc: andrii@kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@google.com, haoluo@google.com, jolsa@kernel.org, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, davem@davemloft.net, 
	dsahern@kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	netdev@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_184408_282948_7EF6A468 
X-CRM114-Status: GOOD (  16.46  )
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

T24gTW9uLCBNYXIgMTEsIDIwMjQgYXQgMTE6MjnigK9QTSBRdWVudGluIE1vbm5ldCA8cXVlbnRp
bkBpc292YWxlbnQuY29tPiB3cm90ZToKPgo+IDIwMjQtMDMtMTEgMDk6MzUgVVRDKzAwMDAgfiBN
ZW5nbG9uZyBEb25nIDxkb25nbWVuZ2xvbmcuOEBieXRlZGFuY2UuY29tPgo+ID4gQWRkIHN1cHBv
cnQgZm9yIHRoZSBhdHRhY2ggdHlwZXMgb2Y6Cj4gPgo+ID4gQlBGX1RSQUNFX0ZFTlRSWV9NVUxU
SQo+ID4gQlBGX1RSQUNFX0ZFWElUX01VTFRJCj4gPiBCUEZfTU9ESUZZX1JFVFVSTl9NVUxUSQo+
ID4KPiA+IFNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdtZW5nbG9uZy44QGJ5dGVk
YW5jZS5jb20+Cj4gPiAtLS0KPiA+ICB0b29scy9icGYvYnBmdG9vbC9jb21tb24uYyB8ICAgMyAr
Cj4gPiAgdG9vbHMvbGliL2JwZi9icGYuYyAgICAgICAgfCAgMTAgKysrCj4gPiAgdG9vbHMvbGli
L2JwZi9icGYuaCAgICAgICAgfCAgIDYgKysKPiA+ICB0b29scy9saWIvYnBmL2xpYmJwZi5jICAg
ICB8IDE2OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPiAgdG9vbHMv
bGliL2JwZi9saWJicGYuaCAgICAgfCAgMTQgKysrKwo+ID4gIHRvb2xzL2xpYi9icGYvbGliYnBm
Lm1hcCAgIHwgICAxICsKPiA+ICA2IGZpbGVzIGNoYW5nZWQsIDE5OSBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy9icGYvYnBmdG9vbC9jb21t
b24uYyBiL3Rvb2xzL2JwZi9icGZ0b29sL2NvbW1vbi5jCj4gPiBpbmRleCBjYzZlNmFhZTI0NDcu
LmZmYzg1MjU2NjcxZCAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL2JwZi9icGZ0b29sL2NvbW1vbi5j
Cj4gPiArKysgYi90b29scy9icGYvYnBmdG9vbC9jb21tb24uYwo+ID4gQEAgLTEwODksNiArMTA4
OSw5IEBAIGNvbnN0IGNoYXIgKmJwZl9hdHRhY2hfdHlwZV9pbnB1dF9zdHIoZW51bSBicGZfYXR0
YWNoX3R5cGUgdCkKPiA+ICAgICAgIGNhc2UgQlBGX1RSQUNFX0ZFTlRSWTogICAgICAgICAgICAg
ICAgICByZXR1cm4gImZlbnRyeSI7Cj4gPiAgICAgICBjYXNlIEJQRl9UUkFDRV9GRVhJVDogICAg
ICAgICAgICAgICAgICAgcmV0dXJuICJmZXhpdCI7Cj4gPiAgICAgICBjYXNlIEJQRl9NT0RJRllf
UkVUVVJOOiAgICAgICAgICAgICAgICAgcmV0dXJuICJtb2RfcmV0IjsKPiA+ICsgICAgIGNhc2Ug
QlBGX1RSQUNFX0ZFTlRSWV9NVUxUSTogICAgICAgICAgICByZXR1cm4gImZlbnRyeV9tdWx0aSI7
Cj4gPiArICAgICBjYXNlIEJQRl9UUkFDRV9GRVhJVF9NVUxUSTogICAgICAgICAgICAgcmV0dXJu
ICJmZXhpdF9tdWx0aSI7Cj4gPiArICAgICBjYXNlIEJQRl9NT0RJRllfUkVUVVJOX01VTFRJOiAg
ICAgICAgICAgcmV0dXJuICJtb2RfcmV0X211bHRpIjsKPiA+ICAgICAgIGNhc2UgQlBGX1NLX1JF
VVNFUE9SVF9TRUxFQ1Q6ICAgICAgICAgICByZXR1cm4gInNrX3NrYl9yZXVzZXBvcnRfc2VsZWN0
IjsKPiA+ICAgICAgIGNhc2UgQlBGX1NLX1JFVVNFUE9SVF9TRUxFQ1RfT1JfTUlHUkFURTogICAg
ICAgIHJldHVybiAic2tfc2tiX3JldXNlcG9ydF9zZWxlY3Rfb3JfbWlncmF0ZSI7Cj4gPiAgICAg
ICBkZWZhdWx0OiAgICAgICAgcmV0dXJuIGxpYmJwZl9icGZfYXR0YWNoX3R5cGVfc3RyKHQpOwo+
Cj4gSGksIHBsZWFzZSBkcm9wIHRoaXMgcGFydCBpbiBicGZ0b29sLgo+Cj4gYnBmX2F0dGFjaF90
eXBlX2lucHV0X3N0cigpIGlzIHVzZWQgZm9yIGxlZ2FjeSBhdHRhY2ggdHlwZSBuYW1lcyB0aGF0
Cj4gd2VyZSB1c2VkIGJlZm9yZSBicGZ0b29sIHN3aXRjaGVkIHRvIGxpYmJwZl9icGZfYXR0YWNo
X3R5cGVfc3RyKCksIGFuZAo+IHRoYXQgYXJlIHN0aWxsIHN1cHBvcnRlZCB0b2RheS4gVGhlIG5h
bWVzIGZvciBuZXcgYXR0YWNoIHR5cGVzIHNob3VsZAo+IGp1c3QgYmUgcmV0cmlldmVkIHdpdGgg
bGliYnBmX2JwZl9hdHRhY2hfdHlwZV9zdHIoKS4gQW5kIGZ1bmN0aW9uCj4gYnBmX2F0dGFjaF90
eXBlX2lucHV0X3N0cigpIGlzIGFsc28gb25seSB1c2VkIGZvciBhdHRhY2hpbmcKPiBjZ3JvdXAt
cmVsYXRlZCBwcm9ncmFtcyB3aXRoICJicGZ0b29sIGNncm91cCAoYXR8ZGUpdGFjaCIuCgpPa2F5
ISBJIHdhcyBjb25mdXNlZCBhYm91dCB0aGlzIGZ1bmN0aW9uLCB3aGljaCBoYXMgcmVkdXBsaWNh
dGVkCmluZm9ybWF0aW9uIGFib3V0IHRoZSBhdHRhY2ggdHlwZSBuYW1lLCBhbmQgSSB1bmRlcnN0
YW5kIGl0IG5vdy4KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwoKPgo+IFRoYW5rcywKPiBRdWVudGlu
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC875C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Apr 2024 19:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BghPmkg40nVEPIx13j7w6h4GfpkMOdrGU595GE0k+Ag=; b=ioMWi3O/XkD59p
	mpkmdDhuEyDAr03KvCjv+0l5kWPCzZN9MYm9X6QdoPrSREJD+r+CxQ0c/7iBcMM3KPPoQ2Kn8bVRF
	w7B3n4ljljD34VqX4sSX237kr3HmLEJW/w7l85vLv+1Is7iC2nubtpnidfYBwvPan8Lh1zstpDE/E
	Vu95JqFYaGriWSphIfHvheEnCdVP+5Qe6Mf9ubnfH/8mq/Who6TX0y3LfhZvkywKfL9ICg+VYjUOy
	ZlBVg5Km6lGqCdFFdF6SveagqDS4ilIla/FmUhcS/CtyVJlekrvRZMBSTJWGYV3OEHolX/9euP1bb
	7cgGRbgp5dkpolGcuI+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1t0l-00000007hKo-3gwx;
	Tue, 30 Apr 2024 19:19:31 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1t0c-00000007hJ7-3AeP
	for linux-riscv@lists.infradead.org;
	Tue, 30 Apr 2024 19:19:29 +0000
Received: by mail-ed1-x543.google.com with SMTP id 4fb4d7f45d1cf-56e69888a36so6466277a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 30 Apr 2024 12:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714504759; x=1715109559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8uFehdUx8z7xRSqATk4C9fttlOvgfKnCVngjCGKN8k=;
        b=a8LHNJswRsXuYgJIeStgpYLOAtyjuy9sLr+v0ZHNhyJKbBUKt7myAm/AafzRg9WSYA
         e/othLnLwTZ1tqnHtyMAbEsLB0rdEjW9DPufVTWCvvF/FUX6G3wiD700AEwoufvMnE2l
         Coqn+B4QC8wLVDuXAqmcTu8oGVLLJ4HRWYDU5HjUoG4VUcNXSPhIUoFQduu5HwJV+TH7
         upNCejd9rWkpn5eHrfmNJwyoML6ylPPu5II+pDkjB8qYFXyNzyv9kPpty/M+AwKA0lbt
         La0kxuDRrYOkl1QGbzZmbyVniQr1dvDUCHRGlkr6osr97dk28+qstA675hjcwf/t1mrG
         gWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714504759; x=1715109559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8uFehdUx8z7xRSqATk4C9fttlOvgfKnCVngjCGKN8k=;
        b=n3F9BohlsWali6kdQkKWtqwr7LvtniLIHtAp2IxKBovBHh7wYwGb6q88uuxPFR3vYI
         6MuG4uHda+GXCBRGosRqz0mg6MP40o67A1U9NPp0NRKKasC4+UHetJLlC6Cp4QOQIdG+
         G2vQ4rc4Sb5ReqLR0rY2lDrBImvVwUxqBpbPKO7/jE+HZv/myXkEMCztJ/e8uOFM/fy7
         niJ4Akc0E6426Pv+l7wRnZru4J0wAl1R/bOwp+gPw6rABmx3P2k7sSFTdFAz9Jc1b1Tb
         xfYF2bun24ayw6+mAXXTGnzqacDZ3OeU84SVj/jj1eNly0f1m+DPj8kwQWYGuqSTCmq/
         YFRA==
X-Forwarded-Encrypted: i=1; AJvYcCUGx3bElY44nSgSOeBDudxr7dlPtnMBhjZb+OaviO1pLx8Ub38CcBm9KrBOhL7YbdDA7Uk7BClGsrSlwaHS7EouTUbmSMtXysJpl327N9H8
X-Gm-Message-State: AOJu0YxuO1PvTxsPSPhP8MivyaYt64RNVG4qxIQcruB3Ed71PyMYmDwE
	PAarKtXajH0EEESg/1gcmG41wndlaOoloqUsKgdW1F2/jVx49/sVJPcaEvBuxKt084jbh1hkZob
	RYHccU1YlpRr7Pqq7bcZmQi18Bij8/sBE
X-Google-Smtp-Source: AGHT+IEKrt23r1vzcFtSNgqLbuDM5BDbdQzAfothjE9a3Eoilzg+lQJblIhWkCeheA0myxL8nNfFZi4b+9i0EQuW3Rc=
X-Received: by 2002:a50:f613:0:b0:572:47be:be36 with SMTP id
 c19-20020a50f613000000b0057247bebe36mr182665edn.0.1714504758705; Tue, 30 Apr
 2024 12:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240430175834.33152-1-puranjay@kernel.org> <20240430175834.33152-3-puranjay@kernel.org>
In-Reply-To: <20240430175834.33152-3-puranjay@kernel.org>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 30 Apr 2024 21:18:42 +0200
Message-ID: <CAP01T74ASv5t8O1SPZgsWhgymK3303x9z3mFroHNgaHEZdjoxA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] riscv, bpf: inline bpf_get_smp_processor_id()
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, bpf@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pu Lehui <pulehui@huawei.com>, puranjay12@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_121928_247524_B061B139 
X-CRM114-Status: GOOD (  12.26  )
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

T24gVHVlLCAzMCBBcHIgMjAyNCBhdCAyMDowMCwgUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gSW5saW5lIHRoZSBjYWxscyB0byBicGZfZ2V0X3NtcF9wcm9j
ZXNzb3JfaWQoKSBpbiB0aGUgcmlzY3YgYnBmIGppdC4KPgo+IFJJU0NWIHNhdmVzIHRoZSBwb2lu
dGVyIHRvIHRoZSBDUFUncyB0YXNrX3N0cnVjdCBpbiB0aGUgVFAgKHRocmVhZAo+IHBvaW50ZXIp
IHJlZ2lzdGVyLiBUaGlzIG1ha2VzIGl0IHRyaXZpYWwgdG8gZ2V0IHRoZSBDUFUncyBwcm9jZXNz
b3IgaWQuCj4gQXMgdGhyZWFkX2luZm8gaXMgdGhlIGZpcnN0IG1lbWJlciBvZiB0YXNrX3N0cnVj
dCwgd2UgY2FuIHJlYWQgdGhlCj4gcHJvY2Vzc29yIGlkIGZyb20gVFAgKyBvZmZzZXRvZihzdHJ1
Y3QgdGhyZWFkX2luZm8sIGNwdSkuCj4KPiAgICAgICAgICAgUklTQ1Y2NCBKSVQgb3V0cHV0IGZv
ciBgY2FsbCBicGZfZ2V0X3NtcF9wcm9jZXNzb3JfaWRgCj4gICAgICAgICAgID09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+Cj4gICAgICAgICAg
ICAgICAgIEJlZm9yZSAgICAgICAgICAgICAgICAgICAgICAgICAgIEFmdGVyCj4gICAgICAgICAg
ICAgICAgLS0tLS0tLS0gICAgICAgICAgICAgICAgICAgICAgICAgLS0tLS0tLQo+Cj4gICAgICAg
ICAgYXVpcGMgICB0MSwweDg0OGMgICAgICAgICAgICAgICAgICBsZCAgICBhNSwzMih0cCkKPiAg
ICAgICAgICBqYWxyICAgIDYwNCh0MSkKPiAgICAgICAgICBtdiAgICAgIGE1LGEwCj4KPiBCZW5j
aG1hcmsgdXNpbmcgWzFdIG9uIFFlbXUuCj4KPiAuL2JlbmNocy9ydW5fYmVuY2hfdHJpZ2dlci5z
aCBnbG9iLWFyci1pbmMgYXJyLWluYyBoYXNoLWluYwo+Cj4gKy0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tKwo+IHwgICAg
ICBOYW1lICAgICB8ICAgICBCZWZvcmUgICAgICAgfCAgICAgICBBZnRlciAgICAgIHwgICAlIGNo
YW5nZSAgIHwKPiB8LS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS18Cj4gfCBnbG9iLWFyci1pbmMgIHwgMS4wNzcgwrEgMC4w
MDZNL3MgfCAxLjMzNiDCsSAwLjAxME0vcyB8ICAgKyAyNC4wNCUgICB8Cj4gfCBhcnItaW5jICAg
ICAgIHwgMS4wNzggwrEgMC4wMDJNL3MgfCAxLjMzMiDCsSAwLjAxNU0vcyB8ICAgKyAyMy41NiUg
ICB8Cj4gfCBoYXNoLWluYyAgICAgIHwgMC40OTQgwrEgMC4wMDRNL3MgfCAwLjY1MyDCsSAwLjAw
MU0vcyB8ICAgKyAzMi4xOCUgICB8Cj4gKy0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tKwo+Cj4gTk9URTogVGhpcyBiZW5j
aG1hcmsgaW5jbHVkZXMgY2hhbmdlcyBmcm9tIHRoaXMgcGF0Y2ggYW5kIHRoZSBwcmV2aW91cwo+
ICAgICAgIHBhdGNoIHRoYXQgaW1wbGVtZW50ZWQgdGhlIHBlci1jcHUgaW5zbi4KPgo+IFsxXSBo
dHRwczovL2dpdGh1Yi5jb20vYW5ha3J5aWtvL2xpbnV4L2NvbW1pdC84ZGVjOTAwOTc1ZWYKPgo+
IFNpZ25lZC1vZmYtYnk6IFB1cmFuamF5IE1vaGFuIDxwdXJhbmpheUBrZXJuZWwub3JnPgo+IC0t
LQoKRm9yIG5vbi1yaXNjdiBiaXRzICgmIGZ3aXcpOgoKQWNrZWQtYnk6IEt1bWFyIEthcnRpa2V5
YSBEd2l2ZWRpIDxtZW14b3JAZ21haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=

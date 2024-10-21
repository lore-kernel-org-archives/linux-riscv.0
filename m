Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD0AD17143
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 23:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHwReHlJrXVqnQjwVomTwcX39lTqR+s1+giE0fVliLU=; b=V2PgySXF+3UhnQ
	Z82oBHIJPGC+hgJ+NlK+HDsmDiejbc+UypogPQk5yevzdjt7d4QWqS21qVPYGE+uBH5Jr+armM8Km
	v5hlydx59AVjqSnzF3ANVSXsUCGinYDjaFwMsRgE08D5K5teRjJdX9JrvnfmDqmes8R6QEgjeRJZZ
	QoM2iwq9TaiBp8st2VR8GabrKIqf1tlXaIJV/uwwdQfFVjrvCOSQV1+Hye8BH/GdtFfQhssiHVZF3
	fSK2yizLhlVCz1M1mVlIR/QvPwOKHEKevi2MFZWAu5ChNOXQSPIWR7CRMld7dJxFzGMcbqOVXAnii
	c7cjslZlQFcyG0+4BlFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t31ps-00000008wks-0nK3;
	Mon, 21 Oct 2024 23:29:16 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t31pd-00000008wiR-2l5A
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 23:29:03 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso3567564b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 16:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729553340; x=1730158140; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0ab/y3NIxWQ5IPwf4tlrWjgA/VWZRdS/usp1PdmtaA=;
        b=N96hXsVP+vQCp11W1naYQpLa3xdOXTiVjdRq2I5WDEcG+78MYaxTabVVfTWgzs4qOf
         Ez7J0ZskPZL5W3DRv53Lsvlz6hmcCd04E0o59xCvGmHC8WPbzmIcSa5q/smFAAw0c3WH
         icwxQ84chhTwLN1UAWYMIaLZI4iBBfQbAMX4YzKvuR0U09XETP7yhRTGiB3ULP4qo8ti
         Rs+khRb+2vn3lD60vVEndLyGD64g92QH2KS7ZsI9RFs1a7DtjmRYVeQ6z7q6XT3htXH8
         XpoXyu8z2HbV3Lj8TSGVu9JH4WMntFtJ7R7Oww/ptbK8Yuui/PLV+g0jf+e0ZSUF6pcj
         Lltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729553340; x=1730158140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0ab/y3NIxWQ5IPwf4tlrWjgA/VWZRdS/usp1PdmtaA=;
        b=tvTaBEFGA48aetZF82avraV9BGadapaTt48q4onbFBNXqfsXpQx0mUG08+OPaiPwqh
         Siz09mCa4G+KnIaaP4q56teHt6J5KUNHI46VYqRCMqbve9hRAMxDYIvujAlHpPPJwyyS
         BWdLkDMX68NNPRoqhnUcS8m5cbvGjJ+k70gudOT9WHt/VygrMXplI8CM4XJcEjLcYyqk
         P759/b0qPEHGE8mYD9uyEgVI0AvhUI87b5iYWlNwtAozPtgY9VECpUYrBV5VsBh4BTx7
         hdNw7rZi42SIRC+PDb069j4rkXKvXt16+W3CieSepBwA26KIuc6Vhbf0JXHoRU/XfeWq
         +k/g==
X-Forwarded-Encrypted: i=1; AJvYcCXiy5cxTEHeNd3+5TE/BK0OGvAkEuoVkT3MKaPt+Lw0ZfklwC5xeUFxpDHW6fDeWQXWllcCn0ZH7JEcdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIau7Cl+QeoKGV1zFAVjd9FjHFhPOwP/bq1i0SaHmCduMU4JM9
	AJh5uAwBV4JPwyHxR3MHwPKh+883oIO9fYsyTJYMyKiW66ZFyAUSTcfod4a9ROyRGwG1Vvqkuzu
	UZoMl3fUxRh8YWga8ZIaQJR2qH7U=
X-Google-Smtp-Source: AGHT+IE+UiBdod8YrP4CWXmEaQOA8OoWyHHG8IWleRCcBhZxXsjPZXGjvcba7orZTZIub5J+BX3UYq9GPtRAU8ZvLAE=
X-Received: by 2002:a05:6a00:9282:b0:71e:587d:f268 with SMTP id
 d2e1a72fcca58-71edbbc153bmr2117649b3a.4.1729553340212; Mon, 21 Oct 2024
 16:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241021122112.101513-1-puranjay@kernel.org> <20241021122112.101513-5-puranjay@kernel.org>
In-Reply-To: <20241021122112.101513-5-puranjay@kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 21 Oct 2024 16:28:47 -0700
Message-ID: <CAEf4BzY1LgCF1VOoAQkMdDTx87C0mfyftMvhvVU4GpsFc6fw5g@mail.gmail.com>
Subject: Re: [PATCH bpf-next 4/5] selftests/bpf: Add benchmark for
 bpf_csum_diff() helper
To: Puranjay Mohan <puranjay@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>, bpf@vger.kernel.org, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Eduard Zingerman <eddyz87@gmail.com>, Eric Dumazet <edumazet@google.com>, Hao Luo <haoluo@google.com>, 
	Helge Deller <deller@gmx.de>, Jakub Kicinski <kuba@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Martin KaFai Lau <martin.lau@linux.dev>, 
	Mykola Lysenko <mykolal@fb.com>, netdev@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Yonghong Song <yonghong.song@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_162901_722468_B3BF2747 
X-CRM114-Status: GOOD (  18.27  )
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

T24gTW9uLCBPY3QgMjEsIDIwMjQgYXQgNToyMuKAr0FNIFB1cmFuamF5IE1vaGFuIDxwdXJhbmph
eUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEFkZCBhIG1pY3JvYmVuY2htYXJrIGZvciBicGZfY3N1
bV9kaWZmKCkgaGVscGVyLiBUaGlzIGJlbmNobWFyayB3b3JrcyBieQo+IGZpbGxpbmcgYSA0S0Ig
YnVmZmVyIHdpdGggcmFuZG9tIGRhdGEgYW5kIGNhbGN1bGF0aW5nIHRoZSBpbnRlcm5ldAo+IGNo
ZWNrc3VtIG9uIGRpZmZlcmVudCBwYXJ0cyBvZiB0aGlzIGJ1ZmZlciB1c2luZyBicGZfY3N1bV9k
aWZmKCkuCj4KPiBFeGFtcGxlIHJ1biB1c2luZyAuL2JlbmNocy9ydW5fYmVuY2hfY3N1bV9kaWZm
LnNoIG9uIHg4Nl82NDoKPgo+IFticGZdJCAuL2JlbmNocy9ydW5fYmVuY2hfY3N1bV9kaWZmLnNo
Cj4gNCAgICAgICAgICAgICAgICAgICAgMi4yOTYgwrEgMC4wNjZNL3MgKGRyb3BzIDAuMDAwIMKx
IDAuMDAwTS9zKQo+IDggICAgICAgICAgICAgICAgICAgIDIuMzIwIMKxIDAuMDAzTS9zIChkcm9w
cyAwLjAwMCDCsSAwLjAwME0vcykKPiAxNiAgICAgICAgICAgICAgICAgICAyLjMxNSDCsSAwLjAw
MU0vcyAoZHJvcHMgMC4wMDAgwrEgMC4wMDBNL3MpCj4gMjAgICAgICAgICAgICAgICAgICAgMi4z
MTggwrEgMC4wMDFNL3MgKGRyb3BzIDAuMDAwIMKxIDAuMDAwTS9zKQo+IDMyICAgICAgICAgICAg
ICAgICAgIDIuMzA4IMKxIDAuMDAzTS9zIChkcm9wcyAwLjAwMCDCsSAwLjAwME0vcykKPiA0MCAg
ICAgICAgICAgICAgICAgICAyLjMwMCDCsSAwLjAyOU0vcyAoZHJvcHMgMC4wMDAgwrEgMC4wMDBN
L3MpCj4gNjQgICAgICAgICAgICAgICAgICAgMi4yODYgwrEgMC4wMDFNL3MgKGRyb3BzIDAuMDAw
IMKxIDAuMDAwTS9zKQo+IDEyOCAgICAgICAgICAgICAgICAgIDIuMjUwIMKxIDAuMDAxTS9zIChk
cm9wcyAwLjAwMCDCsSAwLjAwME0vcykKPiAyNTYgICAgICAgICAgICAgICAgICAyLjE3MyDCsSAw
LjAwMU0vcyAoZHJvcHMgMC4wMDAgwrEgMC4wMDBNL3MpCj4gNTEyICAgICAgICAgICAgICAgICAg
Mi4wMjMgwrEgMC4wNTVNL3MgKGRyb3BzIDAuMDAwIMKxIDAuMDAwTS9zKQoKeW91IGFyZSBub3Qg
YmVuY2htYXJraW5nIGJwZl9jc3VtX2RpZmYoKSwgeW91IGFyZSBiZW5jaG1hcmtpbmcgaG93Cm9m
dGVuIHlvdSBjYW4gY2FsbCBicGZfcHJvZ190ZXN0X3J1bigpLiBBZGQgc29tZSBiYXRjaGluZyBv
biB0aGUgQlBGCnNpZGUsIHRoZXNlIG51bWJlcnMgdGVsbCB5b3UgdGhhdCB0aGVyZSBpcyBubyBk
aWZmZXJlbmNlIGJldHdlZW4KY2FsY3VsYXRpbmcgY2hlY2tzdW0gZm9yIDQgYnl0ZXMgYW5kIGZv
ciA1MTIsIHRoYXQgZGlkbid0IHNlZW0gc3RyYW5nZQp0byB5b3U/Cgpwdy1ib3Q6IGNyCgo+Cj4g
U2lnbmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5QGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9NYWtlZmlsZSAgICAgICAgICB8ICAgMiAr
Cj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9iZW5jaC5jICAgICAgICAgICB8ICAgNCAr
Cj4gIC4uLi9zZWxmdGVzdHMvYnBmL2JlbmNocy9iZW5jaF9jc3VtX2RpZmYuYyAgICB8IDE2NCAr
KysrKysrKysrKysrKysrKysKPiAgLi4uL2JwZi9iZW5jaHMvcnVuX2JlbmNoX2NzdW1fZGlmZi5z
aCAgICAgICAgIHwgIDEwICsrCj4gIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2dzL2NzdW1fZGlmZl9i
ZW5jaC5jICAgICB8ICAyNSArKysKPiAgNSBmaWxlcyBjaGFuZ2VkLCAyMDUgaW5zZXJ0aW9ucygr
KQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvYnBmL2JlbmNo
cy9iZW5jaF9jc3VtX2RpZmYuYwo+ICBjcmVhdGUgbW9kZSAxMDA3NTUgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvYnBmL2JlbmNocy9ydW5fYmVuY2hfY3N1bV9kaWZmLnNoCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvY3N1bV9kaWZmX2JlbmNo
LmMKPgoKWy4uLl0KCj4gKwo+ICtzdGF0aWMgdm9pZCBjc3VtX2RpZmZfc2V0dXAodm9pZCkKPiAr
ewo+ICsgICAgICAgaW50IGVycjsKPiArICAgICAgIGNoYXIgKmJ1ZmY7Cj4gKyAgICAgICBzaXpl
X3QgaSwgc3o7Cj4gKwo+ICsgICAgICAgc3ogPSBzaXplb2YoY3R4LnNrZWwtPnJvZGF0YS0+YnVm
Zik7Cj4gKwo+ICsgICAgICAgc2V0dXBfbGliYnBmKCk7Cj4gKwo+ICsgICAgICAgY3R4LnNrZWwg
PSBjc3VtX2RpZmZfYmVuY2hfX29wZW4oKTsKPiArICAgICAgIGlmICghY3R4LnNrZWwpIHsKPiAr
ICAgICAgICAgICAgICAgZnByaW50ZihzdGRlcnIsICJmYWlsZWQgdG8gb3BlbiBza2VsZXRvblxu
Iik7Cj4gKyAgICAgICAgICAgICAgIGV4aXQoMSk7Cj4gKyAgICAgICB9Cj4gKwo+ICsgICAgICAg
c3JhbmRvbSh0aW1lKE5VTEwpKTsKPiArICAgICAgIGJ1ZmYgPSBjdHguc2tlbC0+cm9kYXRhLT5i
dWZmOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBTZXQgZmlyc3QgOCBieXRlcyBvZiBi
dWZmZXIgdG8gMHhkZWFkYmVlZmRlYWRiZWVmLCB0aGlzIGlzIGxhdGVyIHVzZWQgdG8gdmVyaWZ5
IHRoZQo+ICsgICAgICAgICogY29ycmVjdG5lc3Mgb2YgdGhlIGhlbHBlciBieSBjb21wYXJpbmcg
dGhlIGNoZWNrc3VtIHJlc3VsdCBmb3IgMHhkZWFkYmVlZmRlYWRiZWVmIHRoYXQKPiArICAgICAg
ICAqIHNob3VsZCBiZSAweDNiM2IKPiArICAgICAgICAqLwo+ICsKPiArICAgICAgICoodTY0ICop
YnVmZiA9IDB4ZGVhZGJlZWZkZWFkYmVlZjsKPiArCj4gKyAgICAgICBmb3IgKGkgPSA4OyBpIDwg
c3o7IGkrKykKPiArICAgICAgICAgICAgICAgYnVmZltpXSA9ICcxJyArIHJhbmRvbSgpICUgOTsK
CnNvLCB5b3Ugb25seSBnZW5lcmF0ZSA5IGRpZmZlcmVudCB2YWx1ZXMgZm9yIGJ5dGVzLCB3aHk/
IFdoeSBub3QgZnVsbApieXRlIHJhbmdlPwoKPiArCj4gKyAgICAgICBjdHguc2tlbC0+cm9kYXRh
LT5idWZmX2xlbiA9IGFyZ3MuYnVmZl9sZW47Cj4gKwo+ICsgICAgICAgZXJyID0gY3N1bV9kaWZm
X2JlbmNoX19sb2FkKGN0eC5za2VsKTsKPiArICAgICAgIGlmIChlcnIpIHsKPiArICAgICAgICAg
ICAgICAgZnByaW50ZihzdGRlcnIsICJmYWlsZWQgdG8gbG9hZCBza2VsZXRvblxuIik7Cj4gKyAg
ICAgICAgICAgICAgIGNzdW1fZGlmZl9iZW5jaF9fZGVzdHJveShjdHguc2tlbCk7Cj4gKyAgICAg
ICAgICAgICAgIGV4aXQoMSk7Cj4gKyAgICAgICB9Cj4gK30KPiArCgpbLi4uXQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C326BC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 19:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWp3pd4wteFXqp4RHpr/XV3Kdf52hCNviBSG6gQIc+U=; b=css4VzKBsTT4Ch
	XvFT8lmBy+Yto4t5k+1VdBvwbqbkVUoHvmfoo5vR5iIrbbJjJ8ooAtsHZq4mXQmUVWQm1oHqms0Dc
	r9qaIBMFvIqJCvjoigzl78L9P32UEkt/uo4mlQ4P0Jt+P+hRqUEinW5S8ZcXH6lOx9+3S9YwIqzIF
	q4GMNXOQsDGLmCcJD/eKTXp4+XJ6aYCrBflEGzQCeE5MXZyYNPRKDct0+uZZiqLrKxbN0Z95PrNmP
	qzEUsqD5Tuxr5anm2JYkOrx+qjhF4v7DNBtC13p4UpsyUEkRJiM77xOomF/Iy8kWOQZWMI6qa5inf
	wdyh4bm1jsn+Umh7XK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sADqL-000000076S1-020I;
	Thu, 23 May 2024 19:11:13 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sADqG-000000076QM-3TOA
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 19:11:10 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-36d92f4e553so3325765ab.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 12:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716491466; x=1717096266; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fC9kDW+kPeeEhu/sk0DK4Ea1cI30Dc81o1at+TwfLXw=;
        b=HZ/MnHIX1var79AqsTyps2wErObTt0Xt9/rhFk2GeBG5Q2BBb7YoV3mJBlhjEVjURO
         hILz9J2NkAV+QmXyLR9errWkbp9Ivzd95xosllKYUaHl/8cjI0d8m/i+xfwvOcn6BNgo
         Ub6SGwNlLR85r7lT9cLQ52lAvDcgRoMr91oyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716491466; x=1717096266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fC9kDW+kPeeEhu/sk0DK4Ea1cI30Dc81o1at+TwfLXw=;
        b=hqW1WZslrsaI72hJ7YjVBzke6pzCwQuXzuHuCYdk2y70n/LiTE2NSYHUAP46plkBvX
         km29Zsmv1odjnFOnlaGMHkq1h0x6P6A178w+u+ydraMKIrK5E828cmbc9M89T1dv5AhU
         cM9kI/JK9ZCyOXBl0TwdQEnsxlAqpaD+pbRBWqRVtZtrtnYTZD4K/ipPdcQaTlQQ42Pn
         3UCJ5ox37V/MyZsHsCJXeSoncb3wfHNj8DDTcUhvPPCkFvM+hmBbUxB+cS3af7nVMO+c
         /B59ccxkLlooW+8qQFP1HN8orXPcAar6np8HpTi1rO4dUWS1T+L/G3J1mAduJGny+VKB
         HeQw==
X-Forwarded-Encrypted: i=1; AJvYcCVUBA0OO0QhRGlNQyWzu2OFmdasQZFU+nVI0ChlBt3qVGFhlThGse1H0KadVUbqcGAM2Hs4upWgywZRcO1A31Tj7ShYRKIXwUgcsVNyeRfp
X-Gm-Message-State: AOJu0YxWkhS/MPBDFy3UIAPpZMPsELRNUNJDxWk/eLFqFgPvxoI4/aF6
	W/4j39CvLnKvvtftmPER8nz/1YNZNUwkHxzfWW+H00jjpLwB1HVu8qkIno9E9gE=
X-Google-Smtp-Source: AGHT+IGUJadL8tuWvotBY37jyLWH4W/NEbNhdUB06VeC+bbGevmqUO6z3gpToFd7ayYeeicIf3AIYA==
X-Received: by 2002:a05:6e02:1fc1:b0:36c:3856:4386 with SMTP id e9e14a558f8ab-3737b3cad00mr2165555ab.3.1716491465698;
        Thu, 23 May 2024 12:11:05 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b03ece4797sm1493173.170.2024.05.23.12.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 May 2024 12:11:05 -0700 (PDT)
Message-ID: <b208df48-b909-4f2d-8bc2-80531c044470@linuxfoundation.org>
Date: Thu, 23 May 2024 13:11:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/68] kselftest: Desecalate reporting of missing
 _GNU_SOURCE
To: Edward Liaw <edliaw@google.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Mark Brown <broonie@kernel.org>,
 shuah@kernel.org, =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 Christian Brauner <brauner@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Kees Cook
 <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>,
 Will Drewry <wad@chromium.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-team@android.com,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240522005913.3540131-1-edliaw@google.com>
 <20240522005913.3540131-3-edliaw@google.com>
 <94b73291-5b8a-480d-942d-cfc72971c2f5@sirena.org.uk>
 <CAG4es9WAASaSG+Xgp31-kLT3G8wpeT5vAqbCA4r=Z8G_zAF73w@mail.gmail.com>
 <9e2677ec-1d54-4969-907b-112b71ef8dd3@nvidia.com>
 <d5471e30-227d-4e6d-9bbd-90a74bd9006b@linuxfoundation.org>
 <CAG4es9XU2fMo7hBv81vpn1JGKFWt9gExOhyAyRtOc-5OR5eiLQ@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAG4es9XU2fMo7hBv81vpn1JGKFWt9gExOhyAyRtOc-5OR5eiLQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_121109_434745_12C8E4B4 
X-CRM114-Status: GOOD (  12.03  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS8yMy8yNCAxMjoxMiwgRWR3YXJkIExpYXcgd3JvdGU6Cj4gT24gVGh1LCBNYXkgMjMsIDIw
MjQgYXQgMTE6MDLigK9BTSBTaHVhaCBLaGFuIDxza2hhbkBsaW51eGZvdW5kYXRpb24ub3JnPiB3
cm90ZToKPj4KPj4gT24gNS8yMi8yNCAyMDoyOCwgSm9obiBIdWJiYXJkIHdyb3RlOgo+Pj4gT24g
NS8yMi8yNCAxMDo0NiBBTSwgRWR3YXJkIExpYXcgd3JvdGU6Cj4+Pj4gT24gV2VkLCBNYXkgMjIs
IDIwMjQgYXQgNDoyMeKAr0FNIE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4gd3JvdGU6
Cj4+Pj4+IE9uIFdlZCwgTWF5IDIyLCAyMDI0IGF0IDEyOjU2OjQ4QU0gKzAwMDAsIEVkd2FyZCBM
aWF3IHdyb3RlOgo+Pj4gLi4uCj4+Pj4+IFlvdSd2ZSBub3QgcHJvdmlkZWQgYSBTaWduZWQtb2Zm
LWJ5IGZvciB0aGlzIHNvIHBlb3BsZSBjYW4ndCBkbyBhbnl0aGluZwo+Pj4+PiB3aXRoIGl0LCBw
bGVhc2Ugc2VlIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0IGZv
cgo+Pj4+PiBkZXRhaWxzIG9uIHdoYXQgdGhpcyBpcyBhbmQgd2h5IGl0J3MgaW1wb3J0YW50Lgo+
Pj4+Cj4+Pj4gU29ycnksIG15IG1pc3Rha2UsIEkgZm9yZ290IHRvIGFkZCBpdCBhZnRlciBjaGVy
cnktcGlja2luZy4gIElmIGFkZGVkCj4+Pgo+Pj4gQWRkaW5nIHRoaXMgdG8geW91ciAuZ2l0Y29u
ZmlnIHdvdWxkIGNvdmVyIHlvdSBmb3IgY2FzZXMgbGlrZSB0aGlzLCBJIHRoaW5rCj4+PiBpdCdz
IHByZXR0eSBjb21tb24gdG8gZG8gdGhpczoKPj4+Cj4+PiBbZm9ybWF0XQo+Pj4gICAgICAgc2ln
bm9mZiA9IHRydWUKPj4+Cj4+Pgo+IAo+IFRoYW5rcyBNYXJrLCBJJ2xsIGFkZCB0aGF0Lgo+IAo+
Pgo+PiBNYXJrLCBFZHdhcmQsCj4+Cj4+IElzIHRoaXMgcGF0Y2ggc3RpbGwgbmVjZXNzYXJ5IG9m
IHRoZSBzZXJpZXMgaXMgZHJvcHBlZD8KPj4KPj4gdGhhbmtzLAo+PiAtLSBTaHVhaAo+Pgo+IAo+
IE5vLCBpdCBpcyBub3QgbmVjZXNzYXJ5IGFueW1vcmUuCgpUaGFuayB5b3UgRWR3YXJkLgoKdGhh
bmtzLAotLSBTaHVhaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=

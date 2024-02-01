Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B538DC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 16:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cqVoymukLSlMsL67jM1FNAfyaoJ/uiBnt4B+CzyIV1E=; b=4I6RIUZxCJas/2
	pfKF7y0gYs5rzayiSBmOVBKCqHdD1JEOmNHqjQb0CycKsE5xWh6YRJm4nqPynrLwTTVG8loyiamhI
	vIaf4xw2w9jTTV+uvtmhxq/03TV9IuDyeDmvLApSehaFF26PqEqC1fjcMQ10x0Pec+lbSByNDY3cp
	vZCFRXoSFWR1EetQ6mFeemxPbWOwB8P6oFBUIjHyh+ZZf/w3SzNNtRffRJIlZJACITi87AA4/CD7e
	No3yScPg5xXxnOuq6qoqzx2cWFFC3tChcEDHe4/293bhPW37vaCoKeg0il/wz6O6TYppB8nQuIcV4
	18OFolga7zhXyuOwHOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZnO-00000008c8M-00Po;
	Thu, 01 Feb 2024 16:20:10 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVZnL-00000008c3C-0idO
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 16:20:08 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2cf1fd1cc5bso15012061fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 08:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706804399; x=1707409199; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygH1ANBFQzdbWHqig1KvXevLJTUpUKVJInoERj5H7V4=;
        b=GDjg3Aj+DkYsLEB2Ai6ZR+Ijyw97tvBZZ00SekbmEh3v5XcHE2QxISQZ807uVw2xZO
         OkKMkFkAc+Wf+g+GIc3PJ6kPPWO5oi14mEgo/hghr2KGfDnJQVNQ1OXK0jf8wmk3dPoh
         pIb3cTnvchA2DR/yYykR7/Awtsa6FOND8WPae4Y+OwG1PP2Re7OYN5GzByJHUze2lWV5
         C0LIlWKkrUmWqz90zeSQLTmY/xs2UjKj0eAldJNocJff/PF5kGCAMo1mSgCi6gCTRg7u
         7m4B2GGy3HrzaSj7fZE8bY6QBVAc2zXgB7+96S3QYrkh4hWtM7UNwH98XxYWcruueiYe
         uz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706804399; x=1707409199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygH1ANBFQzdbWHqig1KvXevLJTUpUKVJInoERj5H7V4=;
        b=kfyU0fA2hqw03nvhfEaehaVt8Q77bW54838XPRZm+Wn1uyIiJ0pXZxSce0PA9xL5Ps
         UwsR7cKC1zYtGqGEva9XfJc/vtQlnTXQUb68dOUvvVDGpDMKeAN05DQR2HZeHCyWc2Cg
         s9iIPwzxqr/9jJg6HRZ46h5/mpBVl6d43Mbe0dWRlSvpzoa0LkPxmFPar+gMHnAVjlwu
         o3iIZJbM3Q/7X1nGdoxKpAO876spkn37KxiGirBYUUgYl6Jw2SFDOoyL3PcHT9AGDySU
         +3GiywTdcxF3Msh8Lnr7YQ50hyxI6RejKvVblOmzl779VzYKXngNoOMNpwAymAbdcQ1s
         wJPA==
X-Gm-Message-State: AOJu0Yz1tBamu+XIyvUUT+vuYeXyrY7cROBpRp+26kZXkIzRHalX4fmV
	9fOEB46VAJODAmRjfnxXp3bItzd9S3SRH60fGkyHl3UcJXjQeEQY8KMxLHiSAb/vmYYgPvjYTku
	ek+4NpcL4QQPhnc2CuPBdWX/eCD4=
X-Google-Smtp-Source: AGHT+IEboM9BU1D2N1zSAOvc+WKlkpgFNHKYIUTTDXV+yPQMssdBnKXS+jMSgdgp9NElwX1iLJcp9P1fdOcXCG6REiQ=
X-Received: by 2002:a2e:9c8d:0:b0:2cd:50a7:12d0 with SMTP id
 x13-20020a2e9c8d000000b002cd50a712d0mr3708974lji.38.1706804398627; Thu, 01
 Feb 2024 08:19:58 -0800 (PST)
MIME-Version: 1.0
References: <20240201083351.943121-1-pulehui@huaweicloud.com> <1e7181e4-c4c5-d307-2c5c-5bf15016aa8a@iogearbox.net>
In-Reply-To: <1e7181e4-c4c5-d307-2c5c-5bf15016aa8a@iogearbox.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 1 Feb 2024 08:19:47 -0800
Message-ID: <CAADnVQ+rLneO4t=YYmLYtc945Fz0=ucNTWZBxgvs8toFY-onRg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/4] Mixing bpf2bpf and tailcalls for RV64
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Pu Lehui <pulehui@huaweicloud.com>, bpf <bpf@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Network Development <netdev@vger.kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Luke Nelson <luke.r.nels@gmail.com>, 
	Pu Lehui <pulehui@huawei.com>, Leon Hwang <hffilwlqm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_082007_235327_151357FC 
X-CRM114-Status: GOOD (  10.97  )
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

T24gVGh1LCBGZWIgMSwgMjAyNCBhdCAyOjU24oCvQU0gRGFuaWVsIEJvcmttYW5uIDxkYW5pZWxA
aW9nZWFyYm94Lm5ldD4gd3JvdGU6Cj4KPiA+IHdpbGwgYmUgZGVzdHJveWVkLiBTbyB3ZSBpbXBs
ZW1lbnRlZCBtaXhpbmcgYnBmMmJwZiBhbmQgdGFpbGNhbGxzCj4gPiBzaW1pbGFyIHRvIHg4Nl82
NCwgaS5lLiB1c2luZyBhIG5vbi1jYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8gdHJhbnNmZXIKLi4u
Cj4gSWl1YywgdGhpcyBzdGlsbCBuZWVkcyBhIHJlc3BpbiBhcyBwZXIgdGhlIG9uZ29pbmcgZGlz
Y3Vzc2lvbnMuIEFsc28sCj4gaWYgeW91IGhhdmUgd29ya2VkIG9uIEJQRiBzZWxmdGVzdHMgd2hp
Y2ggZXhlcmNpc2UgdGhlIGNvcm5lciBjYXNlCj4gYXJvdW5kIGE2LCBwbGVhc2UgaW5jbHVkZSB0
aGVtIGluIHRoZSBzZXJpZXMgYXMgd2VsbCBmb3IgY292ZXJhZ2UuCgpIb2xkIG9uLCBmb2xrcy4K
SSdtIG5vdCBzdXJlIGl0J3Mgc3VjaCBhIGNvZGUgaWRlYSB0byBzdXBwb3J0IHRhaWxjYWxscyBm
cm9tIHN1YnByb2dzCmluIHJpc2Mtdi4KVGhleSdyZSBicm9rZW4gb24geDg2LTY0IGFuZCBzbyBm
YXIgc2V2ZXJhbCBhdHRlbXB0cyB0byBmaXggdGhlbQp3ZXJlIG5vdCBzdWNjZXNzZnVsLgpJZiB3
ZSBkb24ndCBoYXZlIGEgZml4IHNvb24gd2Ugd2lsbCBkaXNhYmxlIHRoaXMgZmVhdHVyZSBjb21w
bGV0ZWx5CmluIHRoZSB2ZXJpZmllci4KSW4gZ2VuZXJhbCB0YWlsY2FsbGluZyBmcm9tIHN1YnBy
b2dzIGlzIGEgbmljaGUgdXNlIGNhc2UuCklmIHRoZXJlIGFyZSB1c2VycyB0aGV5IHNob3VsZCB0
cmFuc2l0aW9uIHRvIHRhaWwgY2FsbCBmcm9tIG1haW4gcHJvZyBvbmx5LgoKU2VlCmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2JwZi9DQUFEblZRSjFzenJ5OVAwMHd3ZVZEdTRkMEFRb01fNDlxVC1f
dWVpcnZnZ0FpQ1pycHdAbWFpbC5nbWFpbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

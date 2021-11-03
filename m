Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01160C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 07:41:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B738A610FC
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 07:41:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B738A610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9N924l+2SoDy/V5z0EnHP8OPJo7I02/IHly1Z3lkUq8=; b=CGzSdxEdkLIh+M
	B9gXHr+EJF9HMtFrjBtgKm1fWX5ZV7ku19/Xqtc+Bv3mpCdfizoWpPxQ1DL5kn0LCwKcvIsXQNe2q
	Rw1I+f/NVvQe+kMZKz7itp+RTRjaYceCrXv9K/ZzlYZLr8uH+d6wl4hEielYk3ekgugiRk5Awuts2
	J8ujdtgj3RfH8s8uKZuwHPenxSgEi2myZy5lKZJ4yTUjJVxmLXzW11xurK4OhHd/0KbB/sS/CwDzE
	7gGX/nPDb8aZBSIZy5xXHrAaNop2bPAAq4DPp+W8caeYndIPAVYSmTKR3M/3jXFVyl/Zio2KVm4zl
	yQrSlYaYapBGCjt6cKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miAta-004Qew-4m; Wed, 03 Nov 2021 07:41:18 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miAtW-004Qdu-Hp
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 07:41:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id o14so2081899wra.12
 for <linux-riscv@lists.infradead.org>; Wed, 03 Nov 2021 00:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rEUk3hjZbgaNLemqWe9Q44RKe4LYiJjMpeJVdUSL6cI=;
 b=SzSEr4GzUIi1n53esxrhyzEL+hnpq51VXmuNzoRbJng2jp0GsMOv6J6G+0AUT7sKib
 WaR12lSVZFAI5pPfRFm9i0NG3DAZEN4srkUw67DLwYHYnhu3wUCn780FuNIYfO0LzT40
 1Nj9cfpioDcXN/7KmFeruIRM9XUofAP7KZhnQMRuqUkJhuz49XhNdRrR2FIzrb8Ah5f0
 xSfFjOU9PBmgkriGn55A5Q6gxEwiETQJqtV1yx7WGqGX849wiHMl3lVPW3SrzN3LFSmT
 tBrMKwDkH4oSdrSOYaHSJLP2+zRMOnlibiAZVi1+gMlRLxYDs5zu6QQoVEsDBOje/AjA
 dS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rEUk3hjZbgaNLemqWe9Q44RKe4LYiJjMpeJVdUSL6cI=;
 b=yfbUTeJzRrc9srGYUQ/+hjVV2p5ph5k/bn0ObybY71GTjFigOZQ68rPNOpi7ME1QOD
 l+wPvEgV2P5+gwQ4ZkLjFAVHeckLbE7XUf8EeutzISquGNMMwkTKhzoZQ1UP+10e9XgE
 7gNfAY+QODnPwkPbi33vPf8Y7PZME/c5PuuBQKxOgZO0o6tk3vng0cs4LO3YlzO8ytJB
 GTAJbd6RPVIaCa1gqpB7s9ge3haW9mKaY979eqDmc+r5HjDCyWXQO8l2PmsGD7eTTWyc
 w3MGkWMaX21WiWa4iFExfRHQ3tQt4CZHud+tE5gTGdJcJzI9iVTYMnNTyaqg/C+Lo1mo
 RPrw==
X-Gm-Message-State: AOAM530kAEmjOc2ox7NrzAsTl0AOt8Lk2Xf/x3+6k8mANgp+qTCxWw9M
 rByWACArdCIO+G5SA5KUAn/OD9xd+DBCISdBcjI=
X-Google-Smtp-Source: ABdhPJyzngaH7X863kxwlhmnQIi8Eo36rd8szhefxmDQ/tTo5iBVuHnTW5qLSd4+auf3a1fe/uazHgl4Ex4uDlBMxLU=
X-Received: by 2002:a05:6000:12d2:: with SMTP id
 l18mr42076950wrx.289.1635925272752; 
 Wed, 03 Nov 2021 00:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211102145642.724820-1-tongtiangen@huawei.com>
 <CAJ+HfNg1Ki=1Zc+ThW-ynvtDo5=fNAUK-XV08-icz-nY9CNoUQ@mail.gmail.com>
 <448599f5-e773-6ab5-bdaf-289f583edf01@huawei.com>
 <CAJ+HfNj_p36trWFzdyxVVgykrPVq=OvKcYq61w2QyKsHwa0gDw@mail.gmail.com>
 <f3ed7e48-c565-9147-eca0-6298a36b3d61@huawei.com>
In-Reply-To: <f3ed7e48-c565-9147-eca0-6298a36b3d61@huawei.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 3 Nov 2021 08:41:01 +0100
Message-ID: <CAJ+HfNgze3=heV-ehvagHQFc5w6ymZ7XQMfKPzeWBo1M82+E-Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next] riscv, bpf: fix some compiler error
To: tongtiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, 
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Netdev <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_004114_651898_D46F3129 
X-CRM114-Status: GOOD (  12.21  )
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

T24gV2VkLCAzIE5vdiAyMDIxIGF0IDA4OjI2LCB0b25ndGlhbmdlbiA8dG9uZ3RpYW5nZW5AaHVh
d2VpLmNvbT4gd3JvdGU6Cj4KClsuLi5dCgo+Cj4gQWRkaW5nIGEgZnVuY3Rpb24gZGVjbGFyYXRp
b24gaW4gYnBmX2ppdF9jb21wNjQuYyBmaWxlIGNhbm5vdCBmaXggdGhpcyBjb21waWxlciBlcnJv
cjoKPgoKQUZBSUssIHRoZXJlIGFyZSB0d28gaXNzdWVzOgoKMS4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGx2bS8yMDIxMTAyOTAzMzQuMnpkTXlScTQtbGtwQGludGVsLmNvbS8KMi4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGx2bS8yMDIxMTEwMjA2MTAuOW95OVJyMEctbGtwQGludGVsLmNv
bS8KCjEgaXMgYSB3YXJuaW5nIHdoZW4gVz0xIGlzIGVuYWJsZWQgKG1pc3NpbmcgcHJvdG90eXBl
IGZyb20gLVdtaXNzaW5nLXByb3RvdHlwZXMpCjIgaXMgYW4gZXJyb3IsIHNpbmNlIHRoZSBmdW5j
dGlvbiBpcyBub3QgZGVmaW5lZCB3aGVuIGJ1aWxkaW5nIENPTkZJR19BUkNIX1JWMzJJCgpZb3Ug
YXJlIHRyeWluZyB0byBhZGRyZXNzIGJvdGggaXNzdWVzIGluIHRoaXMgcGF0Y2guCgo+IC4uLi4K
PiB3aGVuIENPTkZJR19CUEZfSklUIGFuZCBDT05GSUdfQVJDSF82NEkgaXMgb3BlbiwgVGhlcmUg
aXMgdGhlIGZvbGxvd2luZyBjb21waWxlciBlcnJvciAoVz0xKToKPiAgICBlcnJvcjogbm8gcHJl
dmlvdXMgcHJvdG90eXBlIGZvciAncnZfYnBmX2ZpeHVwX2V4Y2VwdGlvbicKPiAuLi4uCj4KPiBU
byBmaXggdGhpcyBjb21waWxlciBlcnJvciwgeW91IG5lZWQgdG8gbWFrZSBhIGRlY2xhcmF0aW9u
IGluIGEgaGVhZGVyIGZpbGUsIHdoaWNoIGlzIGFsc28KPiB0aGUgcmVhc29uIGZvciBpbnRyb2R1
Y2luZyBleHRhYmxlLmguCj4KCk5vLCB5b3UgZG9uJ3QgbmVlZCB0aGUgaGVhZGVyIGZpbGUuIFRo
ZSBmb3J3YXJkIGRlY2xhcmF0aW9uIGlzCnN1ZmZpY2llbnQgdG8gZ2V0IHJpZCBvZiB0aGUgd2Fy
bmluZywgYW5kIHRoZSBhZGRpbmcgQ09ORklHX0FSQ0hfUlY2NEkKZml4ZXMgdGhlIFJWMzJJIGJ1
aWxkLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F15C25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 21:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfx3C9cZes0BnROgsYSQN477vldmIS1Zw8F1XaaJveU=; b=oTaeq5wqnu5wwu
	jVvOFmbDEc3sCHPEzo7uyfX9P8qEPivPCzWHTN0WkXydnyvHvqCZBRK7jI6e34vYzs4kd3rivrTz0
	qqMP2saX6xEmcTl0k9SpZa74Yhijc9x7L+J9YAR1zkJHLqFd/TdYcrezPSZWjiN4O3rWwdCXJyxTs
	uxE44H0Opux2B3L5wvzPxo7L6+8S5Gkb/aS08O/O2qWDam8WwZQMNnzY9BqqeMTGDdYqM1rZOj+Eq
	24oAFWtkv+B3UT0jMXFPVd0DQOIiJSihukAhKgLY/+SLh5XfMJVNM1VIR5xP6+mTduY3PqkV07t+l
	Up2qxA+D15SOWuN81nCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQSx-00000005Vsk-0fI4;
	Wed, 29 May 2024 21:04:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCQSs-00000005Vqh-3sWg
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 21:04:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-420107286ecso21585e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 14:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717016640; x=1717621440; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCBSe826+nKw2daLQ4TIlXiD2I054RSipXGDwuLppXE=;
        b=zUIrOKdnWSIVVyY80TYoU2yIXT/CVzDCbgRDvSry0bkGb6zPG1cyHzJOvMhzOLIe+/
         inKp2afvsSU11LEb1vt1KYwT50CbrUDTUpVhjdF8DeOaqdhUChyb+Oy49ERwxjwXlQAt
         YqBPXOo5kwJE/EUr9NCJ7D4iQiTYW3I/l4KLOWy+Gh6jpiNXjl5XjJ6xYVssYMBuKwrd
         IHtDqG/WUXRGCkSjIwRaJmvWTBX4iRLIVoOcbCpJsN/gZOKtBZwpPoQh2//epDUpybOn
         G2rQws70PaQqakvZrwVLWZsrK2W1HAlGG3yFTAyL1gSod0+obFJSN/b/vTWHnMc+Sj6l
         fxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717016640; x=1717621440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCBSe826+nKw2daLQ4TIlXiD2I054RSipXGDwuLppXE=;
        b=JoEGogMDrRGN1IIXSTY6Q1CjQsyaSAW7f7ECACkpNSvSXh19AogRxry0r8HKp2hdJn
         5kahvJAHj4qbS0mINfLwRHNHUvFyQoofno3320Hgi9dKrbIoFVDPIL5Fflv4qhGI7rNo
         9g/Gk/Rpjzo6+Nm/aRy09WpLv+G4rMMRIioqZ26GRW2jloB6ZhFY/iGtTL1kn9OX11OE
         6SZj7sWx/XX3HhgRatbl2OS1ZTEaZJxf1z+Wywb4+lw0WGr0BflrGvosXLy8+xF8ky3i
         NIUJD2fTmXTu8T5ywHPCFkoVu6KBw1RRZzJPwZQbUWWuyLS+m9pWz+EFFvxQ5sT41/e0
         8R8A==
X-Forwarded-Encrypted: i=1; AJvYcCXuixj11VRPlcz7V4uHBj7xYHe6zGuWKMBa6o0YAVwgy5Ey3h7+HbS0Y9Zc9olJg1G8iXljWmGkxEQTw7Oe0ZaMyUrKgfBcdY6M1W5Zm3TQ
X-Gm-Message-State: AOJu0YwwafefrCh0CPkeYV5UMPi2fS5gidrtq/QkiFzmmdFaxObj5WBL
	M+TyWkdFIrd+XJuP12cSjkVdEvpfXrksAIKF7dO3tjJ2HU4O+DWThbnbm7vrIpeZMr7gXpnarnd
	dPcbxRgcKJkX5ouCTNQMUQmOuJTnYh0u7Teyc
X-Google-Smtp-Source: AGHT+IHwVBgFo5das5shZb/z5hgC8KCkV+Jkj5w99z9LyfmWhmSM4ldtkdm2dxotNGGlvICz4N/Nu5ZLrwoOjjiw7Io=
X-Received: by 2002:a05:600c:3b85:b0:41b:4c6a:de7a with SMTP id
 5b1f17b1804b1-42127ec7dbdmr148185e9.3.1717016639372; Wed, 29 May 2024
 14:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com> <20240529180510.2295118-3-jthoughton@google.com>
In-Reply-To: <20240529180510.2295118-3-jthoughton@google.com>
From: Yu Zhao <yuzhao@google.com>
Date: Wed, 29 May 2024 15:03:21 -0600
Message-ID: <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
To: James Houghton <jthoughton@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ankit Agrawal <ankita@nvidia.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Bibo Mao <maobibo@loongson.cn>, 
	Catalin Marinas <catalin.marinas@arm.com>, David Matlack <dmatlack@google.com>, 
	David Rientjes <rientjes@google.com>, Huacai Chen <chenhuacai@kernel.org>, 
	James Morse <james.morse@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shaoqin Huang <shahuang@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_140406_992938_A407256F 
X-CRM114-Status: GOOD (  18.10  )
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

T24gV2VkLCBNYXkgMjksIDIwMjQgYXQgMTI6MDXigK9QTSBKYW1lcyBIb3VnaHRvbiA8anRob3Vn
aHRvbkBnb29nbGUuY29tPiB3cm90ZToKPgo+IFNlY29uZGFyeSBNTVVzIGFyZSBjdXJyZW50bHkg
Y29uc3VsdGVkIGZvciBhY2Nlc3MvYWdlIGluZm9ybWF0aW9uIGF0Cj4gZXZpY3Rpb24gdGltZSwg
YnV0IGJlZm9yZSB0aGVuLCB3ZSBkb24ndCBnZXQgYWNjdXJhdGUgYWdlIGluZm9ybWF0aW9uLgo+
IFRoYXQgaXMsIHBhZ2VzIHRoYXQgYXJlIG1vc3RseSBhY2Nlc3NlZCB0aHJvdWdoIGEgc2Vjb25k
YXJ5IE1NVSAobGlrZQo+IGd1ZXN0IG1lbW9yeSwgdXNlZCBieSBLVk0pIHdpbGwgYWx3YXlzIGp1
c3QgcHJvY2VlZCBkb3duIHRvIHRoZSBvbGRlc3QKPiBnZW5lcmF0aW9uLCBhbmQgdGhlbiBhdCBl
dmljdGlvbiB0aW1lLCBpZiBLVk0gcmVwb3J0cyB0aGUgcGFnZSB0byBiZQo+IHlvdW5nLCB0aGUg
cGFnZSB3aWxsIGJlIGFjdGl2YXRlZC9wcm9tb3RlZCBiYWNrIHRvIHRoZSB5b3VuZ2VzdAo+IGdl
bmVyYXRpb24uCgpDb3JyZWN0LCBhbmQgYXMgSSBleHBsYWluZWQgb2ZmbGluZSwgdGhpcyBpcyB0
aGUgb25seSByZWFzb25hYmxlCmJlaGF2aW9yIGlmIHdlIGNhbid0IGxvY2tsZXNzbHkgd2FsayBz
ZWNvbmRhcnkgTU1Vcy4KCkp1c3QgZm9yIHRoZSByZWNvcmQsIHRoZSAoY3J1ZGUpIGFuYWxvZ3kg
SSB1c2VkIHdhczoKSW1hZ2luZSBhIGxhcmdlIHJvb20gd2l0aCBtYW55IGJpbGxzICgkMSwgJDUs
ICQxMCwgLi4uKSBvbiB0aGUgZmxvb3IsCmJ1dCB5b3UgYXJlIG9ubHkgYWxsb3dlZCB0byBwaWNr
IHVwIDEwIG9mIHRoZW0gKGFuZCBwdXQgdGhlbSBpbiB5b3VyCnBvY2tldCkuIEEgc21hcnQgbW92
ZSB3b3VsZCBiZSB0byBzdXJ2ZXkgdGhlIHJvb20gKmZpcnN0IGFuZCB0aGVuKgpwaWNrIHVwIHRo
ZSBsYXJnZXN0IG9uZXMuIEJ1dCBpZiB5b3UgYXJlIGNhcnJ5aW5nIGEgNTAwIGxicyBiYWNrcGFj
aywKeW91IHdvdWxkIGp1c3Qgd2FudCB0byBwaWNrIHVwIHdoaWNoZXZlciB0aGF0J3MgaW4gZnJv
bnQgb2YgeW91IHJhdGhlcgp0aGFuIHdhbGsgdGhlIGVudGlyZSByb29tLgoKTUdMUlUgc2hvdWxk
IG9ubHkgc2NhbiAob3IgbG9va2Fyb3VuZCkgc2Vjb25kYXJ5IE1NVXMgaWYgaXQgY2FuIGJlCmRv
bmUgbG9ja2xlc3MuIE90aGVyd2lzZSwgaXQgc2hvdWxkIGp1c3QgZmFsbCBiYWNrIHRvIHRoZSBl
eGlzdGluZwphcHByb2FjaCwgd2hpY2ggZXhpc3RlZCBpbiBwcmV2aW91cyB2ZXJzaW9ucyBidXQg
aXMgcmVtb3ZlZCBpbiB0aGlzCnZlcnNpb24uCgo+IERvIG5vdCBkbyBsb29rIGFyb3VuZCBpZiB0
aGVyZSBpcyBhIHNlY29uZGFyeSBNTVUgd2UgaGF2ZSB0byBpbnRlcmFjdAo+IHdpdGguCj4KPiBU
aGUgYWRkZWQgZmVhdHVyZSBiaXQgKDB4OCksIGlmIGRpc2FibGVkLCB3aWxsIG1ha2UgTUdMUlUg
YmVoYXZlIGFzIGlmCj4gdGhlcmUgYXJlIG5vIHNlY29uZGFyeSBNTVVzIHN1YnNjcmliZWQgdG8g
TU1VIG5vdGlmaWVycyBleGNlcHQgYXQKPiBldmljdGlvbiB0aW1lLgo+Cj4gU3VnZ2VzdGVkLWJ5
OiBZdSBaaGFvIDx5dXpoYW9AZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIb3Vn
aHRvbiA8anRob3VnaHRvbkBnb29nbGUuY29tPgoKVGhpcyBpcyBub3Qgd2hhdCBJIHN1Z2dlc3Rl
ZCwgYW5kIGl0IHdvdWxkIGhhdmUgYmVlbiBkb25lIGluIHRoZSBmaXJzdApwbGFjZSBpZiBpdCBo
YWRuJ3QgcmVncmVzc2VkIHRoZSBub24tbG9ja2xlc3MgY2FzZS4KCk5BSy4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

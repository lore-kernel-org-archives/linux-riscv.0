Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A470CFC26E
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 06:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nbO66F/BkjfWn+0Jox8abqxMqDNRFWVivnm9qifzzw=; b=aB58DmLbRHVNPb
	HfMtabX4fszuZtG+OKq4wZrKd6M4sKhV8T/VzPW1gO+gsfKgbTZP3G2a4mXuJuzDxqBpiCnnz83Vd
	+yjCwNM8igieNaZVZzqqJFp3eLFAzYn8LI1GSx1lxYSt8p/LD3KzMkZovKAKgsjSAei9ZsfZ0LUUA
	wfXqW4U7FkdTgnLBKN/fdJ/aUnYIoS4YQE3yH1kCfwfflMEMbetJh2biH+Menfrb7WHrJcr0J5Zl2
	ketJCXctQNBUoEfkbpjwZcQyuf6LQVOT9qZR/zkAjRX049ykF9ewfs45Ny8PEDe3DnyoE4kJh3vHw
	ZfY6AIVwnCtafuvG9sKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0bPe-00000007GQk-1xql;
	Tue, 15 Oct 2024 06:52:10 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0bIx-00000007Fag-3Xnd
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 06:45:17 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-837ec133784so133126839f.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 23:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1728974715; x=1729579515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTOjdDeupMvfI1VTnlp57mS+VDL1wc+Sjs4FCRiPhYg=;
        b=BY7774QWwwEDq6cEAAO53JrSLMNjWBR5m6gLlO9V+VVbgtaEOWv4BWu4H2VTsBCg0N
         7kYWZ60nepDnuYwKQaHTGRiKU4wB3T8GaNAFe9V0Up925R1/QOle18w29KtukzltnFCb
         /KIav87wXh1nbSpwDtLqZtpCmCahTLzaHun77RO4zTLM8n+yc3vqKQZgDrI19GinT3sV
         72V/H2zygFOOFmeczSENXT4wY78YappuK8eYb39E0ws+zYD8X1aXUmiWzGQEhCMqAJfD
         oZ+codtSfNDmQeyK7Pzup66VLGiIk5uuuZTEeDoJRc6sGYUbBid0+gkcB3WLQtlSrrPQ
         AbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728974715; x=1729579515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTOjdDeupMvfI1VTnlp57mS+VDL1wc+Sjs4FCRiPhYg=;
        b=xFyy7RW6u0t/XkJvrLFLDQ5V6oVY7s7ZByx3lLJfxnIx1LSG5plVSNS8AUMwGhehJR
         zoyifAbCby2XhOc7rYHUXBXl+DYko5/5J6a2zi9CSV+Mgg9omdBjTTtfDa1iKrm2U/pc
         nKBG4fL6qRu3dgFfGPlkeMmo7EkxZVVeU5bYd70eNaW0PHdHlOJ64ieDQ1308vQgYkhA
         QypJA1bP8gXqtoHI16DDDGdYZdA/ykNEs/Y/yCePzvA0K/RX4qXOwg5/gFg9Spd6mdcx
         tVqqlhfTmgdGcPg7si5ZdtMtKvOUmaRXcBvmMdhQ2dLipdR1L4WWsbqHgQ9MCyGoGg4a
         Mntw==
X-Forwarded-Encrypted: i=1; AJvYcCXt+qamhQNLAWMLpZJ1xxXn9Olv91ejCHl1U1vMfMqMv8uHG+JsnVuEx3SVf+dKrH9+gWYROEV6N6Ostw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwynOUuelZYoKxbeP01QkvEN5PzTmGQx0Uqq7r3KunRPqEianUt
	JxlTJCuOQW8LXfwnKj9S54FoB0wNbFcuT7ggcwgAChkc/YmFgte56VoFr84CjCbcmNamREJI1mQ
	OkjscP2fm5IGYLJ7air7bMXV7Qi5BR2ugfHQpVA==
X-Google-Smtp-Source: AGHT+IF+6ytBf2/P7xS3z4FPEZJZLcGyWg4N3M08mx1lsLaOIO9RQVHctNrSJxlvVx8vLnBAocKVchobXr+NRQLS1Xg=
X-Received: by 2002:a05:6e02:3b0a:b0:3a1:a57a:40a1 with SMTP id
 e9e14a558f8ab-3a3b5f233a9mr120319715ab.5.1728974714838; Mon, 14 Oct 2024
 23:45:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240919160126.44487-1-cyan.yang@sifive.com>
In-Reply-To: <20240919160126.44487-1-cyan.yang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 15 Oct 2024 12:15:04 +0530
Message-ID: <CAAhSdy3x680G2cXqam0uc1kAAg_Cd1tFhBVygOrLZ0bL9ztDBg@mail.gmail.com>
Subject: Re: [PATCH] RISCV: KVM: use raw_spinlock for critical section in imsic
To: Cyan Yang <cyan.yang@sifive.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_234515_917032_8D292618 
X-CRM114-Status: GOOD (  16.51  )
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

T24gVGh1LCBTZXAgMTksIDIwMjQgYXQgOTozMuKAr1BNIEN5YW4gWWFuZyA8Y3lhbi55YW5nQHNp
Zml2ZS5jb20+IHdyb3RlOgo+Cj4gRm9yIHRoZSBleHRlcm5hbCBpbnRlcnJ1cHQgdXBkYXRpbmcg
cHJvY2VkdXJlIGluIGltc2ljLCB0aGVyZSB3YXMgYQo+IHNwaW5sb2NrIHRvIHByb3RlY3QgaXQg
YWxyZWFkeS4gQnV0IHNpbmNlIGl0IHNob3VsZCBub3QgYmUgcHJlZW1wdGVkIGluCj4gYW55IGNh
c2VzLCB3ZSBzaG91bGQgdHVybiB0byB1c2UgcmF3X3NwaW5sb2NrIHRvIHByZXZlbnQgYW55IHBy
ZWVtcHRpb24KPiBpbiBjYXNlIFBSRUVNUFRfUlQgd2FzIGVuYWJsZWQuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBDeWFuIFlhbmcgPGN5YW4ueWFuZ0BzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBZb25n
LVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0K
PiAgYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IGlu
ZGV4IDBhMWU4NTkzMi4uYTgwODVjZDgyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2Fp
YV9pbXNpYy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiBAQCAtNTUsNyAr
NTUsNyBAQCBzdHJ1Y3QgaW1zaWMgewo+ICAgICAgICAgLyogSU1TSUMgU1ctZmlsZSAqLwo+ICAg
ICAgICAgc3RydWN0IGltc2ljX21yaWYgKnN3ZmlsZTsKPiAgICAgICAgIHBoeXNfYWRkcl90IHN3
ZmlsZV9wYTsKPiAtICAgICAgIHNwaW5sb2NrX3Qgc3dmaWxlX2V4dGlycV9sb2NrOwo+ICsgICAg
ICAgcmF3X3NwaW5sb2NrX3Qgc3dmaWxlX2V4dGlycV9sb2NrOwo+ICB9Owo+Cj4gICNkZWZpbmUg
aW1zaWNfdnNfY3NyX3JlYWQoX19jKSAgICAgICAgICAgICAgICAgXAo+IEBAIC02MjIsNyArNjIy
LDcgQEAgc3RhdGljIHZvaWQgaW1zaWNfc3dmaWxlX2V4dGlycV91cGRhdGUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KQo+ICAgICAgICAgICogaW50ZXJydXB0aW9ucyBiZXR3ZWVuIHJlYWRpbmcgdG9w
ZWkgYW5kIHVwZGF0aW5nIHBlbmRpbmcgc3RhdHVzLgo+ICAgICAgICAgICovCj4KPiAtICAgICAg
IHNwaW5fbG9ja19pcnFzYXZlKCZpbXNpYy0+c3dmaWxlX2V4dGlycV9sb2NrLCBmbGFncyk7Cj4g
KyAgICAgICByYXdfc3Bpbl9sb2NrX2lycXNhdmUoJmltc2ljLT5zd2ZpbGVfZXh0aXJxX2xvY2ss
IGZsYWdzKTsKPgo+ICAgICAgICAgaWYgKGltc2ljX21yaWZfYXRvbWljX3JlYWQobXJpZiwgJm1y
aWYtPmVpZGVsaXZlcnkpICYmCj4gICAgICAgICAgICAgaW1zaWNfbXJpZl90b3BlaShtcmlmLCBp
bXNpYy0+bnJfZWl4LCBpbXNpYy0+bnJfbXNpcykpCj4gQEAgLTYzMCw3ICs2MzAsNyBAQCBzdGF0
aWMgdm9pZCBpbXNpY19zd2ZpbGVfZXh0aXJxX3VwZGF0ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIGt2bV9yaXNjdl92Y3B1X3Vuc2V0X2lu
dGVycnVwdCh2Y3B1LCBJUlFfVlNfRVhUKTsKPgo+IC0gICAgICAgc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmaW1zaWMtPnN3ZmlsZV9leHRpcnFfbG9jaywgZmxhZ3MpOwo+ICsgICAgICAgcmF3X3Nw
aW5fdW5sb2NrX2lycXJlc3RvcmUoJmltc2ljLT5zd2ZpbGVfZXh0aXJxX2xvY2ssIGZsYWdzKTsK
PiAgfQo+Cj4gIHN0YXRpYyB2b2lkIGltc2ljX3N3ZmlsZV9yZWFkKHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSwgYm9vbCBjbGVhciwKPiBAQCAtMTA1MSw3ICsxMDUxLDcgQEAgaW50IGt2bV9yaXNjdl92
Y3B1X2FpYV9pbXNpY19pbml0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgIH0KPiAg
ICAgICAgIGltc2ljLT5zd2ZpbGUgPSBwYWdlX3RvX3ZpcnQoc3dmaWxlX3BhZ2UpOwo+ICAgICAg
ICAgaW1zaWMtPnN3ZmlsZV9wYSA9IHBhZ2VfdG9fcGh5cyhzd2ZpbGVfcGFnZSk7Cj4gLSAgICAg
ICBzcGluX2xvY2tfaW5pdCgmaW1zaWMtPnN3ZmlsZV9leHRpcnFfbG9jayk7Cj4gKyAgICAgICBy
YXdfc3Bpbl9sb2NrX2luaXQoJmltc2ljLT5zd2ZpbGVfZXh0aXJxX2xvY2spOwo+Cj4gICAgICAg
ICAvKiBTZXR1cCBJTyBkZXZpY2UgKi8KPiAgICAgICAgIGt2bV9pb2RldmljZV9pbml0KCZpbXNp
Yy0+aW9kZXYsICZpbXNpY19pb2RvZXZfb3BzKTsKPiAtLQo+IDIuMzkuNSAoQXBwbGUgR2l0LTE1
NCkKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

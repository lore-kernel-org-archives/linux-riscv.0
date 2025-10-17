Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4168BCCD195
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 21:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dvAl60WGAJdgeILybFLCuHwzpmwwODk8J8n4QNr7ek=; b=t7dgstN7O9LDb4
	GoxJTrDaWtT2B5WbMI0KcvG9jstxl4PYJ774j2XK2oYQkWXAjXJBncO9TuMwBVAGo0gQ+riKMRodU
	wHrYvVD13iXUhdobvxsgx3X42XZe179K2AH1Iarrfv61+Vz/NtAnpRDchztQNU03KaCq0LTdufrjo
	V71ILh/o7CcblTNxFRXOes3GY7XCTCLEdoPxBNpMHdgQ2Kd+IGxFEMBl5kec2SQV1ENwAqgNqLZaM
	ClkyuN+coc6G9Xv1Oapbbi1mL2Zh52Rmcw9zGJI+tml5ZWI32AbbdOjPakG2Vmr6mXaMya0ARUB1r
	Oy5oCUjxYWG5y2jttwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9sLO-000000095Eq-0eY0;
	Fri, 17 Oct 2025 21:50:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9sLM-000000095EV-1FZc
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 21:50:37 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so3779185a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Oct 2025 14:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760737834; x=1761342634; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXowAklNfKjPPLcmHrBPzos0N/jOzPaWiX92u6a/mNs=;
        b=Xl95kVolR1jz+hRyz2+Fe14JJYj32HZSSKwL6EI+t9dtAl0OH6dEh68jGq52noFQGq
         UW6h7iYlHrS9Up1Yq8P1SRJU/RIKJDFCGdqGqOhijovZAIXxqFCJTl31uF79m8nbsdzE
         mKZ/WbsSUreLX54yTCIgRXydWtk9b05P0jeZ8vvD+9Ur0eEjOaYLZDdWVGToS/KcA0JO
         lXk2EunwFRSi/dmMODaOUn8UDZcr10zZvlB0qyCCYvK9p9+iK7LMMGqIuTxiS2tQlDya
         rmE7iys4kkD9T9SHE4KBi1kIMrR6Y5dwa+MvkOvojmtiR2OTWzBtzSGpf2VhO7tgFDPs
         +o1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760737834; x=1761342634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WXowAklNfKjPPLcmHrBPzos0N/jOzPaWiX92u6a/mNs=;
        b=vnKlLao7bn+7kN+gMR3Yqkv/hnjWaLJk3c+m++ClvApYtSsbJc5Yu+jZ+vXIkcyks9
         ZUksl2gd308qCAhLBEHnk0KEeVuqbOzmOvQz17t5ZQK2tm5hgIpINLhKY+koh12huj4s
         r1sp2LNeSpwkPMRuLIP3ihF8ACtGPWlowhAEY88eej5bH7UjxJGwhSY/fesbwDTRNpmH
         v4GxbUiHrsR1hFUElpsmJTp4qfr6hgFIKw4m5vNsiczpCYksRuMYAu+kktwCkvJLBOS4
         vszjrSE6H90IudO7UiPlFLshChnu4b5j7hsOQQnXhQiYwHsn0MFM0rHrS9E37z2cWaxF
         beUg==
X-Forwarded-Encrypted: i=1; AJvYcCVyoYMUZ0nXXrKErRilJwdD9FKsgcEQQwEZmE+XuUo8lZmJqkU5ui8jQTdlILHPNV/UwK/+H0stBXFb3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEDCrgaleRllD1Hqme609j5DRGnCom5Ahgf6a1pwaNOpvB1/WD
	RErOKNtZ+HPa+8I84BZxOy/ct9cXy0xf/NU7+l6oJSU2lDh1rO0o+PijFx3YF2pGXwQPqcS6IsC
	sm5Z7gI1IgF7YeK0O5zGzCvUfytOLtHg=
X-Gm-Gg: ASbGncsfas9JpQMCKzHBR/Z0JLl6PrFbFcOxTpXeaLmPthrQEVXK+bSNMOou0OI5q2E
	JuYojztG3w5V1H0S4pu7kDYGLehGl+xGiotqX3E9ZF/v1ovtntBI0Oer+t45eHYJySrXGIEtlu+
	h4Ew5RGSceRc3uN+5TDKwZX8FOqz5QiGiaQ7RL+R+aKPZ51hdExIleE3YUkwhSq+9SxcecsbzP3
	Uh5YO9VvBZS7W/GUi6KWjQNz3gismhQ2ppQcSyfG74eVhzWy8VPFRSupqEsLcozahB3hZVm/scF
	KKup
X-Google-Smtp-Source: AGHT+IGDex2b2+/U0zVKVr2/MzWeSzQhJyHr6KzFEHvW5oCnc4bul8RVh0QOd8xsaqk3b7DaOTMOmuMeLkfSMN3JHFA=
X-Received: by 2002:a05:6402:35c7:b0:634:ad98:669e with SMTP id
 4fb4d7f45d1cf-63c1f64cb6fmr4928070a12.3.1760737833857; Fri, 17 Oct 2025
 14:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20251013091318.467864-1-yongxuan.wang@sifive.com>
In-Reply-To: <20251013091318.467864-1-yongxuan.wang@sifive.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Fri, 17 Oct 2025 16:50:22 -0500
X-Gm-Features: AS18NWA82u5T2BvACLlWQSx3oMVZ8fIoOSroipFBZryvzDVMCHFcr14soughxtU
Message-ID: <CAFTtA3OW6nDDZP=bZXeBa8ua05QiXO1L92tKvf77WUuJGoengg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Optimize the allocation of vector regset
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_145036_376670_84AF47DC 
X-CRM114-Status: GOOD (  18.19  )
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

T24gTW9uLCBPY3QgMTMsIDIwMjUgYXQgNDoxM+KAr0FNIFlvbmctWHVhbiBXYW5nIDx5b25neHVh
bi53YW5nQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhlIHZlY3RvciByZWdzZXQgdXNlcyB0aGUg
bWF4aW11bSBwb3NzaWJsZSB2bGVuYiA4MTkyIHRvIGFsbG9jYXRlIGEKPiAyXjE4IGJ5dGVzIGJ1
ZmZlciB0byBjb3B5IHRoZSB2ZWN0b3IgcmVnaXN0ZXIuIEJ1dCBtb3N0IHBsYXRmb3Jtcwo+IGRv
buKAmXQgc3VwcG9ydCB0aGUgbGFyZ2VzdCB2bGVuYi4KPgo+IFRoZSByZWdzZXQgaGFzIDIgdXNl
cnMsIHB0cmFjZSBzeXNjYWxsIGFuZCBjb3JlZHVtcC4gV2hlbiBoYW5kbGluZyB0aGUKPiBQVFJB
Q0VfR0VUUkVHU0VUIHJlcXVlc3RzIGZyb20gcHRyYWNlIHN5c2NhbGwsIExpbnV4IHdpbGwgcHJl
cGFyZSBhCj4ga2VybmVsIGJ1ZmZlciB3aGljaCBzaXplIGlzIG1pbih1c2VyIGJ1ZmZlciBzaXpl
LCBsaW1pdCkuIEEgbWFsaWNpb3VzCj4gdXNlciBwcm9jZXNzIG1pZ2h0IG92ZXJ3aGVsbSBhIG1l
bW9yeS1jb25zdHJhaW50ZWQgc3lzdGVtIHdoZW4gdGhlCj4gYnVmZmVyIGxpbWl0IGlzIHZlcnkg
bGFyZ2UuIFRoZSBjb3JlZHVtcCB1c2VzIHJlZ3NldF9nZXRfYWxsb2MoKSB0bwo+IGdldCB0aGUg
Y29udGV4dCBvZiB2ZWN0b3IgcmVnaXN0ZXIuIEJ1dCB0aGlzIEFQSSBhbGxvY2F0ZXMgYnVmZmVy
Cj4gYmVmb3JlIGNoZWNraW5nIHdoZXRoZXIgdGhlIHRhcmdldCBwcm9jZXNzIHVzZXMgdmVjdG9y
IGV4dGVuc2lvbiwgdGhpcwo+IHdhc3RlcyB0aW1lIHRvIHByZXBhcmUgYSBsYXJnZSBtZW1vcnkg
YnVmZmVyLgo+Cj4gVGhlIGJ1ZmZlciBsaW1pdCBjYW4gYmUgZGV0ZXJtaW5lZCBhZnRlciBnZXR0
aW5nIHBsYXRmb3JtIHZsZW5iIGluIHRoZQo+IGVhcmx5IGJvb3Qgc3RhZ2UsIHRoaXMgY2FuIGxl
dCB0aGUgcmVnc2V0IGJ1ZmZlciBtYXRjaCByZWFsIGhhcmR3YXJlCj4gbGltaXRzLiBBbHNvIGFk
ZCAuYWN0aXZlIGNhbGxiYWNrcyB0byBsZXQgdGhlIGNvcmVkdW1wIHNraXAgdmVjdG9yIHBhcnQK
PiB3aGVuIHRhcmdldCBwcm9jZXNzIGRvZXNuJ3QgdXNlIGl0Lgo+Cj4gQWZ0ZXIgdGhpcyBwYXRj
aHNldCwgdXNlcnNwYWNlIHByb2Nlc3MgbmVlZHMgMiBwdHJhY2Ugc3lzY2FsbHMgdG8KPiByZXRy
aWV2ZSB0aGUgdmVjdG9yIHJlZ3NldCB3aXRoIFBUUkFDRV9HRVRSRUdTRVQuIFRoZSBmaXJzdCBw
dHJhY2UgY2FsbAo+IG9ubHkgcmVhZHMgdGhlIGhlYWRlciB0byBnZXQgdGhlIHZsZW5iIGluZm9y
bWF0aW9uLiBUaGVuIHByZXBhcmUgYQo+IHN1aXRhYmxlIGJ1ZmZlciB0byBnZXQgdGhlIHJlZ2lz
dGVyIGNvbnRleHQuIFRoZSBuZXcgdmVjdG9yIHB0cmFjZQo+IGtzZWxmdGVzdCBkZW1vbnN0cmF0
ZXMgaXQuCgpGb3IgdGhlIGVudGlyZSBzZXJpZXM6ClRlc3RlZC1ieTogQW5keSBDaGl1IDxhbmR5
Ym5hY0BnbWFpbC5jb20+Cgpbb24gcnY2NCB2IGVuYWJsZWQgcWVtdV0KClRoYW5rcyEKCj4KPiAt
LS0KPiB2MjoKPiAtIGZpeCBpc3N1ZXMgaW4gdmVjdG9yIHB0cmFjZSBrc2VsZnRlc3QgKEFuZHkp
Cj4KPiBZb25nLVh1YW4gV2FuZyAoMik6Cj4gICByaXNjdjogcHRyYWNlOiBPcHRpbWl6ZSB0aGUg
YWxsb2NhdGlvbiBvZiB2ZWN0b3IgcmVnc2V0Cj4gICBzZWxmdGVzdHM6IHJpc2N2OiBBZGQgdGVz
dCBmb3IgdGhlIFZlY3RvciBwdHJhY2UgaW50ZXJmYWNlCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS92ZWN0b3IuaCAgICAgICAgICAgICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwv
cHRyYWNlLmMgICAgICAgICAgICAgICAgICAgIHwgIDI0ICsrKy0KPiAgYXJjaC9yaXNjdi9rZXJu
ZWwvdmVjdG9yLmMgICAgICAgICAgICAgICAgICAgIHwgICAyICsKPiAgdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvcmlzY3YvdmVjdG9yL01ha2VmaWxlIHwgICA1ICstCj4gIC4uLi9zZWxmdGVzdHMv
cmlzY3YvdmVjdG9yL3ZzdGF0ZV9wdHJhY2UuYyAgICB8IDEzNCArKysrKysrKysrKysrKysrKysK
PiAgNSBmaWxlcyBjaGFuZ2VkLCAxNjIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jpc2N2L3ZlY3Rvci92
c3RhdGVfcHRyYWNlLmMKPgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3148C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 07:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=via4g43JchrFG+ndmIbk9/ahj/6m5hB3//BqTlyQBvQ=; b=1TScuvJoENSvxz
	mRHPqEB3U74EbKBYk9VBJuYwidvjvyFx070g2noVETGkc3sUEH2kkq4WtVVOysMRANTecSQSh9nH+
	b1PgUWrEH+IxtIx3BUpciq0CXEA3ds1eJSr/Qu8MAPbodptHkbssqSOFGsgT1TCWuvEfPqiMyyoRO
	OT2eOwlZwzu2LPbEIpFvhpCEN1Ya1gEOtWjA1mNy8Q4bZn3pJIKFdKC+fd39987bxuIV7r4WEDLc6
	hjj743u1V5Vay0hPQpmPvAfdHpCLMNBKx2y8Vj5K0APMI83tY+/nYU/F1ICguHAvHypiL7J3Co1/j
	J7atIeVdrJ6rIyG7NNNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCJ6-0098Cz-15;
	Tue, 24 Oct 2023 07:58:32 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCJ2-0098Bw-1l
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 07:58:30 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5b837dc2855so2842354a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 00:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1698134305; x=1698739105; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqVph8BGnQIvj3qNLjA65fQXyMZdDqQskG5rQpKkD6g=;
        b=ZysciA7k+7B6J21Id0sP/0XHV69b7IVIFx+eCGTtEaA22iFmnnXzPiuMfXOCzCWhHv
         8pIyKUT+wU9NkBfLudrKjVIOMor5V/13MYEk3YAWbpjnJMcAHMw29UqMb0SGBNTy9zQM
         /Qg8O5LrQ+ps7zL0cs8shZ9SEe08csRABEGP0nvthsuoZqNP5xhdtXPId37qAeeB6ruA
         xkHeywoam/Kf+E80+9Sl58lu0GW8QXh8UdQo45mboCElkZAkMUOPQujHwRrJljceCTDL
         R2WDdS/rlIkJ/0FFyhr97SJzIAtLyAIDse9sEw9q7lccsruzQIdtOk9ZI+ETbpRVXLR0
         AVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698134305; x=1698739105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqVph8BGnQIvj3qNLjA65fQXyMZdDqQskG5rQpKkD6g=;
        b=Y6NKzzcQwrvRbCqjtDOnJ5Cv2QA21+coUXK0qPvasbYsjkRt33RK1IsAD1pd5pCKlh
         zwLCHCzLiDWYgFeEJMDxPuBh+Ni8dgs9dbFsOTzzcstoxRJr/1Ds9uT1Vb0LVw/vHhhP
         NPUPr/Y9GnK5S2PGiLs3iJsHBOMauAA24BhbbnAkMTuo6vSVvydj7N7ubL4tQq3xS9KN
         fIexM+IrhoAQhNmsW7HqRS5odwAVygp07d+VmByVw8cGZeecx4UGVQsUH+LvAELWCMUh
         HTiBCinZrWMU/S2WpwWEKuvfQTBN9U8RZZQCUG/nfWl40UcuB5wL+ZOXBKn0GAYgsmGW
         47lg==
X-Gm-Message-State: AOJu0YyvW2WU8ft1K3CqyJ8XZe95kizSSQAiRB/P+uWmdYEikQVv1Rzz
	xmH+817xaHgbMpqy2bVHnD3IFIRoWcru1OPl2mP9Mw==
X-Google-Smtp-Source: AGHT+IFxB82dfpwIVZCEtc3Jh13RV+6u4BgREa2RlRY5g1UQgKDkuIsw9FCzZGmL6kyd/1KimQ51A8qhmZD58A9UmkE=
X-Received: by 2002:a17:90a:3902:b0:27c:f4a9:7e20 with SMTP id
 y2-20020a17090a390200b0027cf4a97e20mr19464291pjb.15.1698134305304; Tue, 24
 Oct 2023 00:58:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2p0h8i=GPBx+=ZJVr_PSwOHhTqanJQmOc0O0bw1ffrmw@mail.gmail.com>
In-Reply-To: <CAAhSdy2p0h8i=GPBx+=ZJVr_PSwOHhTqanJQmOc0O0bw1ffrmw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 24 Oct 2023 13:28:13 +0530
Message-ID: <CAAhSdy3rDz+TKV339Ab2fiLym_W-p7Eq1Q95ovxUuCxT0qi6iA@mail.gmail.com>
Subject: Re: KVM/riscv changes for 6.7
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_005828_591634_D85B6F1A 
X-CRM114-Status: GOOD (  16.21  )
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

SGkgUGFvbG8sCgpPbiBUdWUsIE9jdCAyNCwgMjAyMyBhdCAxOjI14oCvUE0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBIaSBQYW9sbywKPgo+IFdlIGhhdmUgdGhl
IGZvbGxvd2luZyBLVk0gUklTQy1WIGNoYW5nZXMgZm9yIDYuNzoKPiAxKSBTbXN0YXRlZW4gYW5k
IFppY29uZCBzdXBwb3J0IGZvciBHdWVzdC9WTQo+IDIpIFZpcnR1YWxpemVkIHNlbnZjZmcgQ1NS
IGZvciBHdWVzdC9WTQo+IDMpIEFkZGVkIFNtc3RhdGVlbiByZWdpc3RlcnMgdG8gdGhlIGdldC1y
ZWctbGlzdCBzZWxmdGVzdHMKPiA0KSBBZGRlZCBaaWNvbmQgdG8gdGhlIGdldC1yZWctbGlzdCBz
ZWxmdGVzdHMKPiA1KSBWaXJ0dWFsaXplZCBTQkkgZGVidWcgY29uc29sZSAoREJDTikgZm9yIEd1
ZXN0L1ZNCj4gNikgQWRkZWQgU0JJIGRlYnVnIGNvbnNvbGUgKERCQ04pIHRvIHRoZSBnZXQtcmVn
LWxpc3Qgc2VsZnRlc3RzCj4KPiBQbGVhc2UgcHVsbC4KPgo+IFBsZWFzZSBub3RlIHRoYXQgdGhl
IGZvbGxvd2luZyBmb3VyIHBhdGNoZXMgYXJlIHBhcnQgb2YgdGhlCj4gc2hhcmVkIHRhZyBrdm0t
cmlzY3Ytc2hhcmVkLXRhZy02LjcgcHJvdmlkZWQgdG8gUGFsbWVyOgo+ICAtIGR0LWJpbmRpbmdz
OiByaXNjdjogQWRkIFppY29uZCBleHRlbnNpb24gZW50cnkKPiAgLSBSSVNDLVY6IERldGVjdCBa
aWNvbmQgZnJvbSBJU0Egc3RyaW5nCj4gIC0gZHQtYmluZGluZ3M6IHJpc2N2OiBBZGQgc21zdGF0
ZWVuIGVudHJ5Cj4gIC0gUklTQy1WOiBEZXRlY3QgU21zdGF0ZWVuIGV4dGVuc2lvbgoKRm9yZ290
ICJHSVQgUFVMTCIgcHJlZml4IGluIHRoZSBlbWFpbC4gUGxlYXNlIGRpc3JlZ2FyZCB0aGlzIGVt
YWlsLgpBcG9sb2dpZXMgZm9yIHRoZSBub2lzZS4KClJlZ2FyZHMsCkFudXAKCj4KPiBSZWdhcmRz
LAo+IEFudXAKPgo+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgOTRmNmYwNTUw
YzYyNWZhYjFmMzczYmI4NmE2NjY5YjQ1ZTk3NDhiMzoKPgo+ICAgTGludXggNi42LXJjNSAoMjAy
My0xMC0wOCAxMzo0OTo0MyAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBv
c2l0b3J5IGF0Ogo+Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0
YWdzL2t2bS1yaXNjdi02LjctMQo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIGQ5
YzAwZjQ0ZTVkZTU0MjM0MGNjZTFkMDllMmM5OTBlMTZjMGVkM2E6Cj4KPiAgIEtWTTogcmlzY3Y6
IHNlbGZ0ZXN0czogQWRkIFNCSSBEQkNOIGV4dGVuc2lvbiB0byBnZXQtcmVnLWxpc3QgdGVzdAo+
ICgyMDIzLTEwLTIwIDE2OjUwOjM5ICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBjaGFu
Z2VzIGZvciA2LjcKPgo+IC0gU21zdGF0ZWVuIGFuZCBaaWNvbmQgc3VwcG9ydCBmb3IgR3Vlc3Qv
Vk0KPiAtIFZpcnR1YWxpemVkIHNlbnZjZmcgQ1NSIGZvciBHdWVzdC9WTQo+IC0gQWRkZWQgU21z
dGF0ZWVuIHJlZ2lzdGVycyB0byB0aGUgZ2V0LXJlZy1saXN0IHNlbGZ0ZXN0cwo+IC0gQWRkZWQg
Wmljb25kIHRvIHRoZSBnZXQtcmVnLWxpc3Qgc2VsZnRlc3RzCj4gLSBWaXJ0dWFsaXplZCBTQkkg
ZGVidWcgY29uc29sZSAoREJDTikgZm9yIEd1ZXN0L1ZNCj4gLSBBZGRlZCBTQkkgZGVidWcgY29u
c29sZSAoREJDTikgdG8gdGhlIGdldC1yZWctbGlzdCBzZWxmdGVzdHMKPgo+IC0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBB
bmRyZXcgSm9uZXMgKDMpOgo+ICAgICAgIE1BSU5UQUlORVJTOiBSSVNDLVY6IEtWTTogQWRkIGFu
b3RoZXIga3NlbGZ0ZXN0cyBwYXRoCj4gICAgICAgS1ZNOiBzZWxmdGVzdHM6IEFkZCBhcnJheSBv
cmRlciBoZWxwZXJzIHRvIHJpc2N2IGdldC1yZWctbGlzdAo+ICAgICAgIEtWTTogcmlzY3Y6IHNl
bGZ0ZXN0czogZ2V0LXJlZy1saXN0IHByaW50X3JlZyBzaG91bGQgbmV2ZXIgZmFpbAo+Cj4gQW51
cCBQYXRlbCAoMTEpOgo+ICAgICAgIFJJU0MtVjogRGV0ZWN0IFppY29uZCBmcm9tIElTQSBzdHJp
bmcKPiAgICAgICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBaaWNvbmQgZXh0ZW5zaW9uIGVudHJ5
Cj4gICAgICAgUklTQy1WOiBLVk06IEFsbG93IFppY29uZCBleHRlbnNpb24gZm9yIEd1ZXN0L1ZN
Cj4gICAgICAgS1ZNOiByaXNjdjogc2VsZnRlc3RzOiBBZGQgc2VudmNmZyByZWdpc3RlciB0byBn
ZXQtcmVnLWxpc3QgdGVzdAo+ICAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogQWRkIHNtc3Rh
dGVlbiByZWdpc3RlcnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiAgICAgICBLVk06IHJpc2N2OiBz
ZWxmdGVzdHM6IEFkZCBjb25kb3BzIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKPiAg
ICAgICBSSVNDLVY6IEFkZCBkZWZpbmVzIGZvciBTQkkgZGVidWcgY29uc29sZSBleHRlbnNpb24K
PiAgICAgICBSSVNDLVY6IEtWTTogQ2hhbmdlIHRoZSBTQkkgc3BlY2lmaWNhdGlvbiB2ZXJzaW9u
IHRvIHYyLjAKPiAgICAgICBSSVNDLVY6IEtWTTogQWxsb3cgc29tZSBTQkkgZXh0ZW5zaW9ucyB0
byBiZSBkaXNhYmxlZCBieSBkZWZhdWx0Cj4gICAgICAgUklTQy1WOiBLVk06IEZvcndhcmQgU0JJ
IERCQ04gZXh0ZW5zaW9uIHRvIHVzZXItc3BhY2UKPiAgICAgICBLVk06IHJpc2N2OiBzZWxmdGVz
dHM6IEFkZCBTQkkgREJDTiBleHRlbnNpb24gdG8gZ2V0LXJlZy1saXN0IHRlc3QKPgo+IE1heXVy
ZXNoIENoaXRhbGUgKDcpOgo+ICAgICAgIFJJU0MtVjogRGV0ZWN0IFNtc3RhdGVlbiBleHRlbnNp
b24KPiAgICAgICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBzbXN0YXRlZW4gZW50cnkKPiAgICAg
ICBSSVNDLVY6IEtWTTogQWRkIGt2bV92Y3B1X2NvbmZpZwo+ICAgICAgIFJJU0MtVjogS1ZNOiBF
bmFibGUgU21zdGF0ZWVuIGFjY2Vzc2VzCj4gICAgICAgUklTQ1Y6IEtWTTogQWRkIHNlbnZjZmcg
Y29udGV4dCBzYXZlL3Jlc3RvcmUKPiAgICAgICBSSVNDVjogS1ZNOiBBZGQgc3N0YXRlZW4wIGNv
bnRleHQgc2F2ZS9yZXN0b3JlCj4gICAgICAgUklTQ1Y6IEtWTTogQWRkIHNzdGF0ZWVuMCB0byBP
TkVfUkVHCj4KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1s
ICAgICAgfCAgMTIgKysKPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAg
ICAgICAgICAgICAgICAgICB8ICAxOCArKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2Fw
LmggICAgICAgICAgICAgICAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20v
a3ZtX2hvc3QuaCAgICAgICAgICAgICAgICAgIHwgIDE4ICsrCj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX3ZjcHVfc2JpLmggICAgICAgICAgICAgIHwgICA3ICstCj4gIGFyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmggICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICsKPiAgYXJjaC9y
aXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgICAgICAgfCAgMTIgKysKPiAg
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jICAgICAgICAgICAgICAgICAgICAgfCAgIDIg
Kwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA3NiArKysrKy0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDcyICsrKysrKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgNjEgKysrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpX3JlcGxhY2UuYyAgICAgICAgICAgICAgICAgIHwgIDMyICsrKwo+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgICB8IDIzMyArKysrKysrKysrKysr
LS0tLS0tLS0KPiAgMTQgZmlsZXMgY2hhbmdlZCwgNDE4IGluc2VydGlvbnMoKyksIDEzNSBkZWxl
dGlvbnMoLSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

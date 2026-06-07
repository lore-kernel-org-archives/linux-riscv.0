Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D8DCD8C8C
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 05:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TQ6mJFoDOVE/94RwTjqNVP33KnnUtvkFiQmxsediVRM=; b=JsESgnN6+ZByrQ
	vxOg8SnGNM1ND7q9sB26sAZeeljl91X+94jVRr1mgsAe+1zYbu4dKFm6JU/MRegFvOhxrpMsfDzJY
	0mQUK3jcmj1EX4SvVCH5kZNaKjC0oT8Linzx+n/FpvNTfRnuTyDKRZubPeewZQJRsINmTp9boN4Ol
	zsnYiyLxEiLCsa8mkR6xGndN8cqqVBdQCSTr3/O+3BKkM2jZ5jaImQwugsn+yhYJeRNDJzH9vnJa3
	R8yQ+0sE/sCgPsHuIZ1g3MWlJs/QA7ol9VTJYLgr+BDSOPKyFc6aHhMUC868px7tGLnOMW5ri2kXh
	C5xA+bLkf+LC2vQ52ytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6TJ-000000023TZ-1XCH;
	Sun, 07 Jun 2026 05:54:57 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW6TG-000000023Sg-1qfC
	for linux-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 05:54:55 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so27366981fa.3
        for <linux-riscv@lists.infradead.org>; Sat, 06 Jun 2026 22:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780811692; cv=none;
        d=google.com; s=arc-20240605;
        b=PrTGhcII5ALMRW15RqNZWzBquFsm0Nag+cbhmHvmRtVjY61WnyoOYH9U8U41zkrvyz
         G4TFsujZOeFpC65ZWRNvVWJ23VZIgWr0ZqOgXAmcUkPwCzrxZZACpkFZc6g9K3Q84lsR
         A6iEGHulOe0FgeRmdefZhzkbebuGkGnVwHzLFcpV+EfrEQ5gFmuibESDWg8S4lfvwGwv
         4UApyeaRMZOfqZSAdC/8BimGeryeCdfCw8bCmCJlmBVRW13kgffShhIukua29b1iPJpA
         MJL1ipo4nQs+iEgmshbmu+e8A5fFLJ5B/awxtlkdlBRyuOPoeIFDXp9oIlqVfI13igaY
         JLew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GI/CELcqqMge0dwSQkZwLgMfV8nY/qrqwPle2IRk0dw=;
        fh=iu/bdQgoJkZfI/5psonOgUzy4otwDWAXios/bhMtiKo=;
        b=XahAk8XyEKFjQ/HkblOGBROsZ8LKI74+qgYDka8bP6hFqFRne7YVf3Av7Es25g3AoW
         hkFxYc6Z0hFM1SnSVerWmFoFsNG8nYKkqE7DN4o04DlDzdIk10/WdsTSXCUmCMYmIHMJ
         lgWcQb+9VhcI+/eWaJWXuu0a2F8pjx7ijsJpLp897ICjcSvgp/9AiB+FmbsxyAwYGZ7F
         elnnAWg0wyWaRvjw77XzJdt+HQza9y1qG1ZGwQp0PIqzTzt14j+D1ZKl8uOZhghcU+sQ
         +K1bsGgNzyxqj2w9+MUzezge2IYrK6X+IdhwkxCzrRryW8kDauIhCDCmf4MByJNjXFtB
         Iocw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1780811692; x=1781416492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI/CELcqqMge0dwSQkZwLgMfV8nY/qrqwPle2IRk0dw=;
        b=Z9z6coOGqFoXokc9pbXaNe9OBkWOJytgCUZKjwoIQHxBnn7J62ay6Ukwxhoaqn08RH
         vXgBo3nt83sHqixxpdCm2GlQJs0NanDwAC722bJI5Y7ZRToJBCa9x3Q3Fx30Dk8rHSBv
         hUM5qat39Q6JBHVha9ZCsMRu3o0L4QuwiGOLLvDrIThrhSewab/mnAEAibB1BxYDHIJM
         dEUQOgcSz+Oeoa5lGCzMVAMPuA50a6QqdiWteO2dhyehqjfd24qU3tsx6nFa1JLEwNlv
         FyDanxSbhVtOThy4wttV5ihMja09K+BwsNKQdIjK4f0Ti1/aC41fiX3FZD7hhZzLWOFi
         c6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780811692; x=1781416492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GI/CELcqqMge0dwSQkZwLgMfV8nY/qrqwPle2IRk0dw=;
        b=Yd5zqxAgIwv8zc91vnVVBBcpS/tzcgL98Z71kLI7IneIRHeB73uDpQZQSkK7P81HOu
         /jp/C0VzEPUNbksynwspnD7yRI5yee5J6N3nrT7plEwUTXwZyyEeVyjWm5FM2C2qK3lt
         MCjhBNqVe1MiPkdcEvdY6dHKj5Sz8f6ZyUUac5sF2vMZaKlLW+0l+amLH4O0n6yCvmAZ
         d7jpfhY6PNUNIdDPxJNiGb9YX4o8H8XoaKVPWIodfstg0koZ0yDOeLlZPcOe5kRW+RAU
         XlUGBhGTsphC1cS9fyrBuQZiaZAT9PvPFfAsR2wA3dzmoRU8I/O1YsrDkKPm/uqX0Nvn
         aXxw==
X-Forwarded-Encrypted: i=1; AFNElJ+NWcDhAKEzH/C8ltqwGqQx/s+ay6ZClGN5tvTYZ3uJb+6vOSd+Gc3m2rNKt//3sJHI52x9lRlAbSCqzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPm06TRr8sIUAsyDFK2NTfEhSzpTDNdktQRgJ/WhRG7oYDeWVT
	SY8yhSN8tlLf4sBdWzgufAyyLVQvgq0PwFqrSyTks7DWHYFjBCAEd9iDQ7+VkwpZn4xljIeGT3x
	xIo3iGaCcycRvdpIIJ4TdHNACLmC/R031GrycRuXhCPRSr+q2uei0
X-Gm-Gg: Acq92OH0qaVekojSBt7fM2Ndo/JFwcmFahRwkvQ2KvRjHLRbVkXwL96tPX0h/o+27WW
	QGGLOeFcsBdGt0fCqmgPWOllUyfRMjvzXCb5cK4R8kteZCNrwLYFeL/Ye8Ok6i+VCh5xbcM9Waf
	Tj+8s99O7VfygRcDoCj62S/J8aJZzG/LLuZ7Xy4cWFu2V6QihU1CZv4zEI2J0g5CDBB4a+N7fZs
	NYUdJrjpJ2eRbFTXeBUXd8SZJve5VqvlHSaQeFqs/SD+Vk8VypneM+5KF/Y21EKk/0Gr1TTYAsU
	90XA3uo1T2jA17dUl3B69euOpYlJdFc9Vim1qCusQNzd2LhX75At
X-Received: by 2002:a05:651c:1423:b0:38a:8602:71aa with SMTP id
 38308e7fff4ca-396d0895469mr18718371fa.16.1780811692124; Sat, 06 Jun 2026
 22:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260604142602.3582602-1-tjytimi@163.com> <20260604142602.3582602-3-tjytimi@163.com>
In-Reply-To: <20260604142602.3582602-3-tjytimi@163.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 7 Jun 2026 11:24:40 +0530
X-Gm-Features: AVVi8CenzaChEvM0QLFFb2Zk6nh65TW0r-wtF9-zKuIk2urNBL-QPcDlyquxHck
Message-ID: <CAK9=C2Xx+wWL=htOvqmPfF4=f68CNF0r3W9nfTNSMjfSyws-tw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] KVM: selftests: Add a hugetlb memslot alignment
 test mode
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_225454_566791_9E40C981 
X-CRM114-Status: GOOD (  26.59  )
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

T24gVGh1LCBKdW4gNCwgMjAyNiBhdCA3OjU44oCvUE0gSmlueXUgVGFuZyA8dGp5dGltaUAxNjMu
Y29tPiB3cm90ZToKPgo+IGt2bV9wYWdlX3RhYmxlX3Rlc3QgY2FuIGFscmVhZHkgZXhlcmNpc2Ug
aHVnZXRsYi1iYWNrZWQgZ3Vlc3QgbWVtb3J5LAo+IGJ1dCBpdCBhbHdheXMgY3JlYXRlcyB0aGUg
dGVzdCBtZW1zbG90IHdpdGggR1BBIGFsaWdubWVudCBtYXRjaGluZyB0aGUKPiBodWdldGxiIGJh
Y2tpbmcgc2l6ZS4gVGhhdCBtaXNzZXMgdGhlIGNhc2Ugd2hlcmUgYSB2YWxpZCBodWdldGxiCj4g
bWVtc2xvdCBpcyBsYXRlciBtb3ZlZCBzbyB0aGF0IHRoZSBtZW1zbG90IEdQQSBhbmQgSFZBIG5v
IGxvbmdlciBoYXZlCj4gdGhlIHNhbWUgb2Zmc2V0IHdpdGhpbiB0aGUgYmFja2luZyBodWdlIHBh
Z2UuCj4KPiBBZGQgYSAtdSBvcHRpb24gdGhhdCBtb3ZlcyB0aGUgdGVzdCBtZW1zbG90IEdQQSBi
eSBvbmUgZ3Vlc3QgcGFnZSBhZnRlcgo+IGNyZWF0aW5nIHRoZSBodWdldGxiIG1lbXNsb3QuIFRo
ZSBtZW1zbG90IGlzIGNyZWF0ZWQgdGhyb3VnaCB0aGUgbm9ybWFsCj4gaGVscGVyIGZpcnN0LCBz
byB0aGUgYmFja2luZyBhbGxvY2F0aW9uIHJlbWFpbnMgdmFsaWQgYW5kIGh1Z2V0bGIgYWxpZ25l
ZC4KPiBNb3ZpbmcgdGhlIG1lbXNsb3QgdGhlbiBjcmVhdGVzIGEgZGVsaWJlcmF0ZSBIVkEvR1BB
IG9mZnNldCBtaXNtYXRjaAo+IGJlZm9yZSB0aGUgZ3Vlc3QgbWFwcGluZyBpcyBpbnN0YWxsZWQu
Cj4KPiBUaGlzIG1vZGUgaXMgdXNlZnVsIGZvciBjaGVja2luZyB0aGF0IGFyY2hpdGVjdHVyZSBN
TVVzIGRvIG5vdCBpbnN0YWxsCj4gYSBibG9jayBtYXBwaW5nIHdoZW4gdGhlIGJsb2NrIHdvdWxk
IG1hcCB0aGUgd3JvbmcgaG9zdCBwYWdlcyBvciBjb3Zlcgo+IG1lbW9yeSBvdXRzaWRlIHRoZSBt
ZW1zbG90LiBUaGUgb3B0aW9uIGlzIHJlc3RyaWN0ZWQgdG8gaHVnZXRsYi1iYWNrZWQKPiB0ZXN0
IG1lbW9yeSBiZWNhdXNlIGl0J3Mgc3BlY2lmaWNhbGx5IGFib3V0IGh1Z2V0bGIgYmxvY2sgbWFw
cGluZwo+IGVsaWdpYmlsaXR5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlueXUgVGFuZyA8dGp5dGlt
aUAxNjMuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgoKSSBkaWQgbm90IG9ic2VydmUgYW55IGltcGFjdCBvbiB0aGUgZGVmYXVsdCB1c2Fn
ZSB3aXRob3V0ICItdSIKb3B0aW9uIGhlbmNlIHF1ZXVlaW5nIGl0IGZvciBMaW51eC03LjIKClRo
YW5rcwpBbnVwCgo+IC0tLQo+IHYxIC0+IHYyOgo+ICAgLSBLZWVwIHRoZSBzZWxmdGVzdCBjaGFu
Z2UgdW5jaGFuZ2VkIGZyb20gdjEKPgo+ICAuLi4vc2VsZnRlc3RzL2t2bS9rdm1fcGFnZV90YWJs
ZV90ZXN0LmMgICAgICAgfCAyOCArKysrKysrKysrKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9rdm1fcGFnZV90YWJsZV90ZXN0LmMgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0va3ZtX3BhZ2VfdGFibGVfdGVzdC5jCj4gaW5kZXggZmM1MjQyZmI5
Li5hOTEwZTNhYmIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2t2
bV9wYWdlX3RhYmxlX3Rlc3QuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9r
dm1fcGFnZV90YWJsZV90ZXN0LmMKPiBAQCAtMjMwLDYgKzIzMCw3IEBAIHN0cnVjdCB0ZXN0X3Bh
cmFtcyB7Cj4gICAgICAgICB1NjQgcGh5c19vZmZzZXQ7Cj4gICAgICAgICB1NjQgdGVzdF9tZW1f
c2l6ZTsKPiAgICAgICAgIGVudW0gdm1fbWVtX2JhY2tpbmdfc3JjX3R5cGUgc3JjX3R5cGU7Cj4g
KyAgICAgICBib29sIG1pc2FsaWduX3Nsb3RfZ3BhOwo+ICB9Owo+Cj4gIHN0YXRpYyBzdHJ1Y3Qg
a3ZtX3ZtICpwcmVfaW5pdF9iZWZvcmVfdGVzdChlbnVtIHZtX2d1ZXN0X21vZGUgbW9kZSwgdm9p
ZCAqYXJnKQo+IEBAIC0yNDQsNiArMjQ1LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1fdm0gKnByZV9p
bml0X2JlZm9yZV90ZXN0KGVudW0gdm1fZ3Vlc3RfbW9kZSBtb2RlLCB2b2lkICphcmcpCj4gICAg
ICAgICB1NjQgZ3Vlc3RfbnVtX3BhZ2VzOwo+ICAgICAgICAgdTY0IGFsaWdubWVudDsKPiAgICAg
ICAgIHZvaWQgKmhvc3RfdGVzdF9tZW07Cj4gKyAgICAgICBzdHJ1Y3QgdXNlcnNwYWNlX21lbV9y
ZWdpb24gKnJlZ2lvbjsKPiAgICAgICAgIHN0cnVjdCBrdm1fdm0gKnZtOwo+Cj4gICAgICAgICAv
KiBBbGlnbiB1cCB0aGUgdGVzdCBtZW1vcnkgc2l6ZSAqLwo+IEBAIC0yNzYsMTMgKzI3OCwyMiBA
QCBzdGF0aWMgc3RydWN0IGt2bV92bSAqcHJlX2luaXRfYmVmb3JlX3Rlc3QoZW51bSB2bV9ndWVz
dF9tb2RlIG1vZGUsIHZvaWQgKmFyZykKPiAgICAgICAgIC8qIEFkZCBhbiBleHRyYSBtZW1vcnkg
c2xvdCB3aXRoIHNwZWNpZmllZCBiYWNraW5nIHNyYyB0eXBlICovCj4gICAgICAgICB2bV91c2Vy
c3BhY2VfbWVtX3JlZ2lvbl9hZGQodm0sIHNyY190eXBlLCBndWVzdF90ZXN0X3BoeXNfbWVtLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRFU1RfTUVNX1NMT1RfSU5ERVgs
IGd1ZXN0X251bV9wYWdlcywgMCk7Cj4gKyAgICAgICByZWdpb24gPSBtZW1zbG90MnJlZ2lvbih2
bSwgVEVTVF9NRU1fU0xPVF9JTkRFWCk7Cj4gKyAgICAgICBob3N0X3Rlc3RfbWVtID0gcmVnaW9u
LT5ob3N0X21lbTsKPiArCj4gKyAgICAgICBpZiAocC0+bWlzYWxpZ25fc2xvdF9ncGEpIHsKPiAr
ICAgICAgICAgICAgICAgVEVTVF9BU1NFUlQoaXNfYmFja2luZ19zcmNfaHVnZXRsYihzcmNfdHlw
ZSksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJNZW1zbG90IEdQQSBtaXNhbGlnbm1l
bnQgcmVxdWlyZXMgaHVnZXRsYiBiYWNraW5nIik7Cj4gKyAgICAgICAgICAgICAgIFRFU1RfQVNT
RVJUKGd1ZXN0X251bV9wYWdlcyA+IDEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICJO
ZWVkIGF0IGxlYXN0IHR3byBndWVzdCBwYWdlcyB0byBtaXNhbGlnbiBtZW1zbG90IEdQQSIpOwo+
ICsKPiArICAgICAgICAgICAgICAgZ3Vlc3RfdGVzdF9waHlzX21lbSArPSBndWVzdF9wYWdlX3Np
emU7Cj4gKyAgICAgICAgICAgICAgIHZtX21lbV9yZWdpb25fbW92ZSh2bSwgVEVTVF9NRU1fU0xP
VF9JTkRFWCwgZ3Vlc3RfdGVzdF9waHlzX21lbSk7Cj4gKyAgICAgICB9Cj4KPiAgICAgICAgIC8q
IERvIG1hcHBpbmcoR1ZBLT5HUEEpIGZvciB0aGUgdGVzdGluZyBtZW1vcnkgc2xvdCAqLwo+ICAg
ICAgICAgdmlydF9tYXAodm0sIGd1ZXN0X3Rlc3RfdmlydF9tZW0sIGd1ZXN0X3Rlc3RfcGh5c19t
ZW0sIGd1ZXN0X251bV9wYWdlcyk7Cj4KPiAtICAgICAgIC8qIENhY2hlIHRoZSBIVkEgcG9pbnRl
ciBvZiB0aGUgcmVnaW9uICovCj4gLSAgICAgICBob3N0X3Rlc3RfbWVtID0gYWRkcl9ncGEyaHZh
KHZtLCAoZ3BhX3QpZ3Vlc3RfdGVzdF9waHlzX21lbSk7Cj4gLQo+ICAgICAgICAgLyogRXhwb3J0
IHNoYXJlZCBzdHJ1Y3R1cmUgdGVzdF9hcmdzIHRvIGd1ZXN0ICovCj4gICAgICAgICBzeW5jX2ds
b2JhbF90b19ndWVzdCh2bSwgdGVzdF9hcmdzKTsKPgo+IEBAIC00MTcsOCArNDI4LDggQEAgc3Rh
dGljIHZvaWQgcnVuX3Rlc3QoZW51bSB2bV9ndWVzdF9tb2RlIG1vZGUsIHZvaWQgKmFyZykKPiAg
c3RhdGljIHZvaWQgaGVscChjaGFyICpuYW1lKQo+ICB7Cj4gICAgICAgICBwdXRzKCIiKTsKPiAt
ICAgICAgIHByaW50ZigidXNhZ2U6ICVzIFstaF0gWy1wIG9mZnNldF0gWy1tIG1vZGVdICIKPiAt
ICAgICAgICAgICAgICAiWy1iIG1lbS1zaXplXSBbLXYgdmNwdXNdIFstcyBtZW0tdHlwZV1cbiIs
IG5hbWUpOwo+ICsgICAgICAgcHJpbnRmKCJ1c2FnZTogJXMgWy1oXSBbLXAgb2Zmc2V0XSBbLW0g
bW9kZV0gWy1iIG1lbS1zaXplXVxuIiwgbmFtZSk7Cj4gKyAgICAgICBwcmludGYoIiAgICAgICAg
ICBbLXYgdmNwdXNdIFstcyBtZW0tdHlwZV0gWy11XVxuIik7Cj4gICAgICAgICBwdXRzKCIiKTsK
PiAgICAgICAgIHByaW50ZigiIC1wOiBzcGVjaWZ5IGd1ZXN0IHBoeXNpY2FsIHRlc3QgbWVtb3J5
IG9mZnNldFxuIgo+ICAgICAgICAgICAgICAgICIgICAgIFdhcm5pbmc6IGEgbG93IG9mZnNldCBj
YW4gY29uZmxpY3Qgd2l0aCB0aGUgbG9hZGVkIHRlc3QgY29kZS5cbiIpOwo+IEBAIC00MjgsNiAr
NDM5LDggQEAgc3RhdGljIHZvaWQgaGVscChjaGFyICpuYW1lKQo+ICAgICAgICAgcHJpbnRmKCIg
LXY6IHNwZWNpZnkgdGhlIG51bWJlciBvZiB2Q1BVcyB0byBydW5cbiIKPiAgICAgICAgICAgICAg
ICAiICAgICAoZGVmYXVsdDogMSlcbiIpOwo+ICAgICAgICAgYmFja2luZ19zcmNfaGVscCgiLXMi
KTsKPiArICAgICAgIHByaW50ZigiIC11OiBtb3ZlIHRoZSB0ZXN0IG1lbXNsb3QgR1BBIGJ5IG9u
ZSBndWVzdCBwYWdlIGFmdGVyIGNyZWF0aW5nXG4iCj4gKyAgICAgICAgICAgICAgIiAgICAgdGhl
IG1lbXNsb3QsIGZvcmNpbmcgYSBodWdldGxiIEhWQS9HUEEgb2Zmc2V0IG1pc21hdGNoXG4iKTsK
PiAgICAgICAgIHB1dHMoIiIpOwo+ICB9Cj4KPiBAQCAtNDQyLDcgKzQ1NSw3IEBAIGludCBtYWlu
KGludCBhcmdjLCBjaGFyICphcmd2W10pCj4KPiAgICAgICAgIGd1ZXN0X21vZGVzX2FwcGVuZF9k
ZWZhdWx0KCk7Cj4KPiAtICAgICAgIHdoaWxlICgob3B0ID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsICJo
cDptOmI6djpzOiIpKSAhPSAtMSkgewo+ICsgICAgICAgd2hpbGUgKChvcHQgPSBnZXRvcHQoYXJn
YywgYXJndiwgImhwOm06Yjp2OnM6dSIpKSAhPSAtMSkgewo+ICAgICAgICAgICAgICAgICBzd2l0
Y2ggKG9wdCkgewo+ICAgICAgICAgICAgICAgICBjYXNlICdwJzoKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBwLnBoeXNfb2Zmc2V0ID0gc3RydG91bGwob3B0YXJnLCBOVUxMLCAwKTsKPiBAQCAt
NDYxLDYgKzQ3NCw5IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gICAgICAg
ICAgICAgICAgIGNhc2UgJ3MnOgo+ICAgICAgICAgICAgICAgICAgICAgICAgIHAuc3JjX3R5cGUg
PSBwYXJzZV9iYWNraW5nX3NyY190eXBlKG9wdGFyZyk7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIGNhc2UgJ3UnOgo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHAubWlzYWxpZ25fc2xvdF9ncGEgPSB0cnVlOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICAgICAgICAgICAgICAgICBjYXNlICdoJzoKPiAgICAgICAgICAgICAgICAg
ZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAgICAgICAgICBoZWxwKGFyZ3ZbMF0pOwo+IC0tCj4g
Mi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

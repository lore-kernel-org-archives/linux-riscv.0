Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC9BCD6E59
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6iLJSTUL5iquKgyrtkrIqta/JzYseAqDHzQF2BLr3vI=; b=q4gj9RqhSt0IZM21hh3SEUI1Fi
	OnsJf23wj6BwEJyQPcXezay6oXjkrmh18xpgqiKBox1c4QssrhozSGtdDT1U1v1aEvAt7m4F73S1G
	q3vm6s3VfjxyPQq627EDcO0VOGp8HpbyDL0Ex8NsHz7wBh4ry4+yz9F9kiTkBQM+LgWpx6RsDWM1Y
	dLyKnCWUeYPKpQz85JIogPP31gipk9G7kd67iqDGlOJ9qzYTKuxDelMe46qrCPgypiY+Z8MdIQf79
	ODPEg/ONoHrfOU+Ggalq/SSOClcZqMfMY3eD+SphYeV/KGY0kh6msdCfL24CEm+ykP6VIbtl7Zirc
	E5ejEApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWlh-00Fa2H-13;
	Wed, 11 Oct 2023 10:48:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqWld-00FZx3-2K
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 10:48:44 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EEC0140342
	for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 10:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697021316;
	bh=cRzOcp0OjwkTIHvUDiChZJdp1mFmpW3qpQhjzVMaHqk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=eHb4G69uXwwxG8Pw+irPis5MOUYA/7derUDcrhQdu05Q8+N3M2dWQeFkcG39Lr7Yt
	 7AguTN8XDyG4VWM86fYuxCb/DOF606cWVhBPQSfBr+2L2c9ZRNotrNcSoKYSwxMwqF
	 g3oEhhXUL2Jc+GsmD45yCCjHPaAvmFp5OqcZU26G+cNARPXl0ne+P1nL2BKd0pBPKZ
	 AcCkBtzJ2oMEh5hEaMa1gNThDwHakeNEPohV1S/WpUBq+YYhTxGtSV0EndJaWM2HL+
	 LimDZBPq6Fq3dUznxVTxuxqnaf3DFu4SAYNhjr8QRbNbLsKu2cwZ5QGEnaLnHk7Kw9
	 HL15FdofVmdzQ==
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-77574c4394aso762879585a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 03:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697021316; x=1697626116;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cRzOcp0OjwkTIHvUDiChZJdp1mFmpW3qpQhjzVMaHqk=;
        b=IgTu2SmP5pEGBFgAQ27EFJaAnfO0gpnQ7y7z+F9591THKtbZ8KXBVhDpQ4aCakBQ5y
         9nbsBbVMffGKgrr4xP3MvUUTjnl2OTJ7Saak68G39G95GRr7ndIPNFTnNz943X4aosEC
         P0fiInBeXZkXe1q+fRvl6ltq7MA+upFbtcEe1nj0dxx5iY8zIfCThdf4PreabF1FDZ7v
         dXtYFWKNU1xTvJ2wIivGmQ4fNyBYiDlZe+uuAVtslMfnEj9etbSYnA/shxvFYC1zUtsg
         wzYVtmdJC1ShMyX8PUaY6OkOJyoFlGKuOzsnOwtHV44LdmrdkQGlUJZxNGQVyQUYsyH9
         DxWA==
X-Gm-Message-State: AOJu0YzJszdKLx3BbWNQm60ChegIMwsAwFpZ9HRPLtyhOfMo80zWzEUQ
	V5crn8JBXTKb8B18CCs73lI7WZz98oIS6LO4YMiHDh0kR6Or0ebf3iMYVUmCLGn8sjTp4WsnP5y
	DtPVzX/M7MoJa2gviZbY/z/vC6CTHJ+Rk1oW+MSwu3tXuJ8Wjo8LveAQlstR2kA==
X-Received: by 2002:a05:620a:2add:b0:775:c0e4:aea4 with SMTP id bn29-20020a05620a2add00b00775c0e4aea4mr21219755qkb.66.1697021315976;
        Wed, 11 Oct 2023 03:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjR/QUpj2CYkbaTJxRPuk6Ar7Wj1IXMKxOW26vNfAf9v6w4Kysa38u+jX8uIxVGyH9EiaIcAKLrY82+Cy46j0=
X-Received: by 2002:a05:620a:2add:b0:775:c0e4:aea4 with SMTP id
 bn29-20020a05620a2add00b00775c0e4aea4mr21219732qkb.66.1697021315660; Wed, 11
 Oct 2023 03:48:35 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Oct 2023 03:48:35 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <22EFF2C197DC5C5A+f82966f5-90cf-09a5-214e-4b0e87bc6064@tinylab.org>
References: <20230914020044.1397356-1-songshuaishuai@tinylab.org>
 <20230914020044.1397356-3-songshuaishuai@tinylab.org> <CAJM55Z8D3yJREg0+UtecW3wpgrGKxZYP73Pvbi2oaQfsZf4Gfw@mail.gmail.com>
 <22EFF2C197DC5C5A+f82966f5-90cf-09a5-214e-4b0e87bc6064@tinylab.org>
Mime-Version: 1.0
Date: Wed, 11 Oct 2023 03:48:35 -0700
Message-ID: <CAJM55Z8OebLJHg3mxk7y7Dw0z=JLgi4j17tQPf4-Mdd0BCQbaw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: kexec_file: Support loading Image binary file
To: Song Shuai <songshuaishuai@tinylab.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lihuafei1@huawei.com, 
	conor.dooley@microchip.com, liaochang1@huawei.com, ajones@ventanamicro.com, 
	alexghiti@rivosinc.com, evan@rivosinc.com, sunilvl@ventanamicro.com, 
	xianting.tian@linux.alibaba.com, samitolvanen@google.com, 
	masahiroy@kernel.org, apatel@ventanamicro.com, jszhang@kernel.org, 
	duwe@suse.de, eric.devolder@oracle.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_034842_193602_1838CE77 
X-CRM114-Status: GOOD (  29.61  )
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

U29uZyBTaHVhaSB3cm90ZToKPgo+Cj4g5ZyoIDIwMjMvOS8xNCAxNjozNywgRW1pbCBSZW5uZXIg
QmVydGhpbmcg5YaZ6YGTOgo+ID4gU29uZyBTaHVhaSB3cm90ZToKPiA+PiBUaGlzIHBhdGNoIGNy
ZWF0ZXMgaW1hZ2Vfa2V4ZWNfb3BzIHRvIGxvYWQgSW1hZ2UgYmluYXJ5IGZpbGUKPiA+PiBmb3Ig
a2V4ZWNfZmlsZV9sb2FkKCkgc3lzY2FsbC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFNvbmcg
U2h1YWkgPHNvbmdzaHVhaXNodWFpQHRpbnlsYWIub3JnPgo+ID4+IC0tLQo+ID4+ICAgYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9pbWFnZS5oICAgICAgICAgfCAgMiArCj4gPj4gICBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2tleGVjLmggICAgICAgICB8ICAxICsKPiA+PiAgIGFyY2gvcmlzY3Yva2Vy
bmVsL01ha2VmaWxlICAgICAgICAgICAgIHwgIDIgKy0KPiA+PiAgIGFyY2gvcmlzY3Yva2VybmVs
L2tleGVjX2ltYWdlLmMgICAgICAgIHwgOTcgKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+
PiAgIGFyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jIHwgIDEgKwo+ID4+ICAg
NSBmaWxlcyBjaGFuZ2VkLCAxMDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva2VybmVsL2tleGVjX2ltYWdlLmMKPiA+Pgo+
ID4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ltYWdlLmggYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2ltYWdlLmgKPiA+PiBpbmRleCBlMGIzMTlhZjM2ODEuLjg5MjdhNmVh
MTEyNyAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ltYWdlLmgKPiA+
PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ltYWdlLmgKPiA+PiBAQCAtMzAsNiArMzAs
OCBAQAo+ID4+ICAgCQkJICAgICAgUklTQ1ZfSEVBREVSX1ZFUlNJT05fTUlOT1IpCj4gPj4KPiA+
PiAgICNpZm5kZWYgX19BU1NFTUJMWV9fCj4gPj4gKyNkZWZpbmUgcmlzY3ZfaW1hZ2VfZmxhZ19m
aWVsZChmbGFncywgZmllbGQpXAo+ID4+ICsJCQkgICAgICAgKCgoZmxhZ3MpID4+IGZpZWxkIyNf
U0hJRlQpICYgZmllbGQjI19NQVNLKQo+ID4KPiA+IEhpIFNvbmcsCj4gPgo+ID4gVGhpcyBtYWNy
byBpcyBhbG1vc3QgRklFTERfR0VUIGZyb20gbGludXgvYml0ZmllbGQuaCAuLgo+ID4KPiA+PiAg
IC8qKgo+ID4+ICAgICogc3RydWN0IHJpc2N2X2ltYWdlX2hlYWRlciAtIHJpc2N2IGtlcm5lbCBp
bWFnZSBoZWFkZXIKPiA+PiAgICAqIEBjb2RlMDoJCUV4ZWN1dGFibGUgY29kZQo+ID4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2tleGVjLmgKPiA+PiBpbmRleCA1MTg4MjVmZTQxNjAuLmI5ZWU4MzQ2Y2M4YyAxMDA2
NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKPiA+PiArKysgYi9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2tleGVjLmgKPiA+PiBAQCAtNTYsNiArNTYsNyBAQCBleHRl
cm4gcmlzY3Zfa2V4ZWNfbWV0aG9kIHJpc2N2X2tleGVjX25vcmVsb2NhdGU7Cj4gPj4KPiA+PiAg
ICNpZmRlZiBDT05GSUdfS0VYRUNfRklMRQo+ID4+ICAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrZXhl
Y19maWxlX29wcyBlbGZfa2V4ZWNfb3BzOwo+ID4+ICtleHRlcm4gY29uc3Qgc3RydWN0IGtleGVj
X2ZpbGVfb3BzIGltYWdlX2tleGVjX29wczsKPiA+Pgo+ID4+ICAgc3RydWN0IHB1cmdhdG9yeV9p
bmZvOwo+ID4+ICAgaW50IGFyY2hfa2V4ZWNfYXBwbHlfcmVsb2NhdGlvbnNfYWRkKHN0cnVjdCBw
dXJnYXRvcnlfaW5mbyAqcGksCj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL01h
a2VmaWxlIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiA+PiBpbmRleCAxYzYyYzYzOWU4
NzUuLjllY2JhMzIzMWEzNiAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtl
ZmlsZQo+ID4+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gPj4gQEAgLTg2LDcg
Kzg2LDcgQEAgZW5kaWYKPiA+PiAgIG9iai0kKENPTkZJR19IT1RQTFVHX0NQVSkJKz0gY3B1LWhv
dHBsdWcubwo+ID4+ICAgb2JqLSQoQ09ORklHX0tHREIpCQkrPSBrZ2RiLm8KPiA+PiAgIG9iai0k
KENPTkZJR19LRVhFQ19DT1JFKQkrPSBrZXhlY19yZWxvY2F0ZS5vIGNyYXNoX3NhdmVfcmVncy5v
IG1hY2hpbmVfa2V4ZWMubwo+ID4+IC1vYmotJChDT05GSUdfS0VYRUNfRklMRSkJKz0ga2V4ZWNf
ZWxmLm8gbWFjaGluZV9rZXhlY19maWxlLm8KPiA+PiArb2JqLSQoQ09ORklHX0tFWEVDX0ZJTEUp
CSs9IGtleGVjX2VsZi5vIGtleGVjX2ltYWdlLm8gbWFjaGluZV9rZXhlY19maWxlLm8KPiA+PiAg
IG9iai0kKENPTkZJR19DUkFTSF9EVU1QKQkrPSBjcmFzaF9kdW1wLm8KPiA+PiAgIG9iai0kKENP
TkZJR19DUkFTSF9DT1JFKQkrPSBjcmFzaF9jb3JlLm8KPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2tlcm5lbC9rZXhlY19pbWFnZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwva2V4ZWNf
aW1hZ2UuYwo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li5iNmFhN2Y1OWJkNTMKPiA+PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwva2V4ZWNfaW1hZ2UuYwo+ID4+IEBAIC0wLDAgKzEsOTcgQEAKPiA+PiArLy8gU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKPiA+PiArLyoKPiA+PiArICogUklTQy1WIEtleGVj
IGltYWdlIGxvYWRlcgo+ID4+ICsgKgo+ID4+ICsgKi8KPiA+PiArCj4gPj4gKyNkZWZpbmUgcHJf
Zm10KGZtdCkJImtleGVjX2ZpbGUoSW1hZ2UpOiAiIGZtdAo+ID4+ICsKPiA+PiArI2luY2x1ZGUg
PGxpbnV4L2Vyci5oPgo+ID4+ICsjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KPiA+PiArI2luY2x1
ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ID4+ICsjaW5jbHVkZSA8bGludXgva2V4ZWMuaD4KPiA+PiAr
I2luY2x1ZGUgPGxpbnV4L3BlLmg+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC9zdHJpbmcuaD4KPiA+
PiArI2luY2x1ZGUgPGFzbS9ieXRlb3JkZXIuaD4KPiA+PiArI2luY2x1ZGUgPGFzbS9pbWFnZS5o
Pgo+ID4+ICsKPiA+PiArc3RhdGljIGludCBpbWFnZV9wcm9iZShjb25zdCBjaGFyICprZXJuZWxf
YnVmLCB1bnNpZ25lZCBsb25nIGtlcm5lbF9sZW4pCj4gPj4gK3sKPiA+PiArCWNvbnN0IHN0cnVj
dCByaXNjdl9pbWFnZV9oZWFkZXIgKmggPQo+ID4+ICsJCShjb25zdCBzdHJ1Y3QgcmlzY3ZfaW1h
Z2VfaGVhZGVyICopKGtlcm5lbF9idWYpOwo+ID4+ICsKPiA+PiArCWlmICghaCB8fCAoa2VybmVs
X2xlbiA8IHNpemVvZigqaCkpKQo+ID4+ICsJCXJldHVybiAtRUlOVkFMOwo+ID4+ICsKPiA+PiAr
CS8qIEFjY29yZGluZyB0byBEb2N1bWVudGF0aW9uL3Jpc2N2L2Jvb3QtaW1hZ2UtaGVhZGVyLnJz
dCwKPiA+PiArCSAqIHVzZSAibWFnaWMyIiBmaWVsZCB0byBjaGVjayB3aGVuIHZlcnNpb24gPj0g
MC4yLgo+ID4+ICsJICovCj4gPj4gKwo+ID4+ICsJaWYgKGgtPnZlcnNpb24gPj0gUklTQ1ZfSEVB
REVSX1ZFUlNJT04gJiYKPiA+PiArCSAgICBtZW1jbXAoJmgtPm1hZ2ljMiwgUklTQ1ZfSU1BR0Vf
TUFHSUMyLCBzaXplb2YoaC0+bWFnaWMyKSkpCj4gPj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gPj4g
Kwo+ID4+ICsJcmV0dXJuIDA7Cj4gPj4gK30KPiA+PiArCj4gPj4gK3N0YXRpYyB2b2lkICppbWFn
ZV9sb2FkKHN0cnVjdCBraW1hZ2UgKmltYWdlLAo+ID4+ICsJCQkJY2hhciAqa2VybmVsLCB1bnNp
Z25lZCBsb25nIGtlcm5lbF9sZW4sCj4gPj4gKwkJCQljaGFyICppbml0cmQsIHVuc2lnbmVkIGxv
bmcgaW5pdHJkX2xlbiwKPiA+PiArCQkJCWNoYXIgKmNtZGxpbmUsIHVuc2lnbmVkIGxvbmcgY21k
bGluZV9sZW4pCj4gPj4gK3sKPiA+PiArCXN0cnVjdCByaXNjdl9pbWFnZV9oZWFkZXIgKmg7Cj4g
Pj4gKwl1NjQgZmxhZ3M7Cj4gPj4gKwlib29sIGJlX2ltYWdlLCBiZV9rZXJuZWw7Cj4gPj4gKwlz
dHJ1Y3Qga2V4ZWNfYnVmIGtidWY7Cj4gPj4gKwlpbnQgcmV0Owo+ID4+ICsKPiA+PiArCS8qIENo
ZWNrIEltYWdlIGhlYWRlciAqLwo+ID4+ICsJaCA9IChzdHJ1Y3QgcmlzY3ZfaW1hZ2VfaGVhZGVy
ICopa2VybmVsOwo+ID4+ICsJaWYgKCFoLT5pbWFnZV9zaXplKSB7Cj4gPj4gKwkJcmV0ID0gLUVJ
TlZBTDsKPiA+PiArCQlnb3RvIG91dDsKPiA+PiArCX0KPiA+PiArCj4gPj4gKwkvKiBDaGVjayBl
bmRpYW5uZXNzICovCj4gPj4gKwlmbGFncyA9IGxlNjRfdG9fY3B1KGgtPmZsYWdzKTsKPiA+PiAr
CWJlX2ltYWdlID0gcmlzY3ZfaW1hZ2VfZmxhZ19maWVsZChmbGFncywgUklTQ1ZfSU1BR0VfRkxB
R19CRSk7Cj4gPgo+ID4gLi5idXQgaGVyZSB5b3UncmUganVzdCB0ZXN0aW5nIGEgc2luZ2xlIGJp
dCwgc28gc2luY2UgYmVfaW1hZ2UgaXMgYSBib29sIGl0Cj4gPiBjb3VsZCBqdXN0IGJlCj4gPiAJ
YmVfaW1hZ2UgPSBmbGFncyAmIFJJU0NWX0lNQUdFX0ZMQUdfQkVfTUFTSzsKPiA+Cj4gPiAvRW1p
bAo+IEhpIEVtaWwsCj4KPiBTb3JyeSBmb3IgdGhlIGRlbGF5ZWQgcmVzcG9uc2UsCj4KPiBUaGUg
YGZsYWdzYCBmaWVsZCBjdXJyZW50bHkgb25seSBoYXMgYml0LTAgdG8gaW5kaWNhdGUgdGhlIGtl
bnJlbAo+IGVuZGlhbm5lc3MsIHlvdXIgY29tbWVudCBsb29rcyBnb29kIGluIHRoaXMgY2FzZS4K
Pgo+IFdoaWxlIGNvbnNpZGVyaW5nIHRoZSBmdXR1cmUgZXh0ZW5zaW9uIG9mIHRoZSBgZmxhZ3Ng
IGZlaWxkLCB0aGUKPiByaXNjdl9pbWFnZV9mbGFnX2ZpZWxkKCkgaXMgbmVjY2Vzc2lyeSB0byBt
YWtlIGNhbGxlcnMgdG8gcmVxdWlyZSB0aGUKPiBiaXRzIHRoZXkgd2FudC4KClJpZ2h0LCBidXQg
cGxlYXNlIGRvbid0IGludmVudCB5b3VyIG93biBGSUVMRF9HRVQgdGhlbi4KCj4KPiBTbyBJIHBy
ZWZlciB0byBrZWVwIHRoaXMgc25pcHBldC4KPiA+Cj4gPj4gKwliZV9rZXJuZWwgPSBJU19FTkFC
TEVEKENPTkZJR19DUFVfQklHX0VORElBTik7Cj4gPj4gKwlpZiAoYmVfaW1hZ2UgIT0gYmVfa2Vy
bmVsKSB7Cj4gPj4gKwkJcmV0ID0gLUVJTlZBTDsKPiA+PiArCQlnb3RvIG91dDsKPiA+PiArCX0K
PiA+PiArCj4gPj4gKwkvKiBMb2FkIHRoZSBrZXJuZWwgaW1hZ2UgKi8KPiA+PiArCWtidWYuaW1h
Z2UgPSBpbWFnZTsKPiA+PiArCWtidWYuYnVmX21pbiA9IDA7Cj4gPj4gKwlrYnVmLmJ1Zl9tYXgg
PSBVTE9OR19NQVg7Cj4gPj4gKwlrYnVmLnRvcF9kb3duID0gZmFsc2U7Cj4gPj4gKwo+ID4+ICsJ
a2J1Zi5idWZmZXIgPSBrZXJuZWw7Cj4gPj4gKwlrYnVmLmJ1ZnN6ID0ga2VybmVsX2xlbjsKPiA+
PiArCWtidWYubWVtID0gS0VYRUNfQlVGX01FTV9VTktOT1dOOwo+ID4+ICsJa2J1Zi5tZW1zeiA9
IGxlNjRfdG9fY3B1KGgtPmltYWdlX3NpemUpOwo+ID4+ICsJa2J1Zi5idWZfYWxpZ24gPSBsZTY0
X3RvX2NwdShoLT50ZXh0X29mZnNldCk7Cj4gPj4gKwo+ID4+ICsJcmV0ID0ga2V4ZWNfYWRkX2J1
ZmZlcigma2J1Zik7Cj4gPj4gKwlpZiAocmV0KSB7Cj4gPj4gKwkJcHJfZXJyKCJFcnJvciBhZGQg
a2VybmVsIGltYWdlIHJldD0lZFxuIiwgcmV0KTsKPiA+PiArCQlnb3RvIG91dDsKPiA+PiArCX0K
PiA+PiArCj4gPj4gKwlpbWFnZS0+c3RhcnQgPSBrYnVmLm1lbTsKPiA+PiArCj4gPj4gKwlwcl9p
bmZvKCJMb2FkZWQga2VybmVsIGF0IDB4JWx4IGJ1ZnN6PTB4JWx4IG1lbXN6PTB4JWx4XG4iLAo+
ID4+ICsJCQkJa2J1Zi5tZW0sIGtidWYuYnVmc3osIGtidWYubWVtc3opOwo+ID4+ICsKPiA+PiAr
CXJldCA9IGxvYWRfZXh0cmFfc2VnbWVudHMoaW1hZ2UsIGtidWYubWVtLCBrYnVmLm1lbXN6LAo+
ID4+ICsJCQkJICBpbml0cmQsIGluaXRyZF9sZW4sIGNtZGxpbmUsIGNtZGxpbmVfbGVuKTsKPiA+
PiArCj4gPj4gK291dDoKPiA+PiArCXJldHVybiByZXQgPyBFUlJfUFRSKHJldCkgOiBOVUxMOwo+
ID4+ICt9Cj4gPj4gKwo+ID4+ICtjb25zdCBzdHJ1Y3Qga2V4ZWNfZmlsZV9vcHMgaW1hZ2Vfa2V4
ZWNfb3BzID0gewo+ID4+ICsJLnByb2JlID0gaW1hZ2VfcHJvYmUsCj4gPj4gKwkubG9hZCA9IGlt
YWdlX2xvYWQsCj4gPj4gK307Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL21h
Y2hpbmVfa2V4ZWNfZmlsZS5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvbWFjaGluZV9rZXhlY19maWxl
LmMKPiA+PiBpbmRleCBhZWRiOGMxNmEyODMuLjVkYzcwMDgzNGYxZSAxMDA2NDQKPiA+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjX2ZpbGUuYwo+ID4+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWNfZmlsZS5jCj4gPj4gQEAgLTE3LDYgKzE3LDcgQEAK
PiA+Pgo+ID4+ICAgY29uc3Qgc3RydWN0IGtleGVjX2ZpbGVfb3BzICogY29uc3Qga2V4ZWNfZmls
ZV9sb2FkZXJzW10gPSB7Cj4gPj4gICAJJmVsZl9rZXhlY19vcHMsCj4gPj4gKwkmaW1hZ2Vfa2V4
ZWNfb3BzLAo+ID4+ICAgCU5VTEwKPiA+PiAgIH07Cj4gPj4KPiA+PiAtLQo+ID4+IDIuMjAuMQo+
ID4+Cj4gPj4KPiA+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+ID4+IGxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cj4gPgo+Cj4gLS0KPiBUaGFua3MKPiBTb25nIFNodWFpCj4KPgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61D5C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 11:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AVQSSHVrwnH/Nq2QDVFp6dMFSzQVJsvYP7nFtaLH6XA=; b=uuZXLTjfrgS+66
	xsOBpj53gCaVswjogVwfUZsd7L2RN3kfHgjhSxIiUT8SD+pFJvwSmIXGv44QzhNDWNJGuis3ivIjk
	8sWE3maILkS6R88N06NwyMu6d5VwXkr6+OvTNSUhS57t19Cfqq2DDnF0o9/6iF+aX/6mFxqsplxI7
	Q1kN4lfEvWVOXI9zcjR+9zUljjdxF6NZb0uD9Ie6+V6YUGQbLvDi/SxBWroeq8vYLKTSt1AomWroZ
	emX2TNKSxixIcKXu/8HQWhCInv+HWNsZTWvUMvVtxUertLeLi8d2+/11IM38ELQp5DpoXvOGhiOwG
	9CJZp8KE0u+MHSF21rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWrR-0083M8-1b;
	Thu, 03 Aug 2023 11:51:21 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRWrO-0083Iz-0x
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 11:51:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so1105511a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 04:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1691063476; x=1691668276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzPKbAFOISRw/5YbvjKOSvX0ETCU4L0S6O4dsEu3NT4=;
        b=NmceIrgAHf6DAIvboMUEJ7JzGv/tctRVCkJT5rFCwP1gjAqtTTP8QBBHcUFFDfMGBs
         BYoMiwGFBUcc4qkO1aP5M+f3VANXSoUG79+qViju1B4qLjEdKSuii/Ejplx775yyq/KY
         kwPpM3SoyKTKiJrPp30PV+xmIGSRPVg2kTQqiX6zrE6KZqRDssx2DXyfePCNsheKnpps
         y7P9xhkULIkmVQ5263v7d+3SilFSbIJvnWQH+1DJzyzAhpl8c6SbxLArCbvMWuvUAQYW
         7i0oTbFZTMHZaNnBJlX8EVHXYOQcZMJygUJ2RX7N99gREQtmg4jdm/X5OEBAAGcseg+n
         mjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691063476; x=1691668276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzPKbAFOISRw/5YbvjKOSvX0ETCU4L0S6O4dsEu3NT4=;
        b=NTV0FUuXu0+lKGzxipnBV+fB3QCB6GXrCMfwK4z4KIzDN1f6qhS8bKInHtLs7oNLp0
         GlVsIEx0khoEv4LT3dIcsguMPBTKmvxhSCfq0X8SlT8HMkYItgN+WHz0YHHx2pvZVius
         3TguLTvQIVW0vVbf9yCttTOEiMMaeRPQf7gd6sh1kUgjK9ZlVaYwehw294fryJ5KolIw
         JPCZhd6qkpDwJNOoQoaDmwDYAp7aFCuowNfI16w8UjrXMMwZkxbAqgmxI0v9rFHmeo9L
         MVZZuo9DSZGkioxZUJZNiQjztSYy7I4Oyx1c7pN/DL8KY+YFqdhaGe6F5IWQL9pP5Cls
         n0jQ==
X-Gm-Message-State: ABy/qLbMFwvF3ftBfZ3loW9Vlfmx35RbbNYuxdKEt16e3vpiwORF/igT
	9MHsQIuJ5rfsSPnBni/I4rnLL567fjNlWZsXYhogUQ==
X-Google-Smtp-Source: APBJJlHaBGbLysLT4OovkxC+A8IVLYfeu33xeC0pulr4EZBtAA8oMQYOh/PvStYR1i80XF9LdMskfV0M9j4jh4uFMsg=
X-Received: by 2002:a17:906:5352:b0:99b:f676:52da with SMTP id
 j18-20020a170906535200b0099bf67652damr7364642ejo.65.1691063476270; Thu, 03
 Aug 2023 04:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230728210122.175229-1-dbarboza@ventanamicro.com> <20230728210122.175229-2-dbarboza@ventanamicro.com>
In-Reply-To: <20230728210122.175229-2-dbarboza@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 3 Aug 2023 17:21:04 +0530
Message-ID: <CAAhSdy28VzHT5NMcPokEm0i3Jdzg=+YQRhLR++YrUt1BykBsFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] RISC-V: KVM: provide UAPI for host SATP mode
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, atishp@atishpatra.org, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_045118_602539_395E279A 
X-CRM114-Status: GOOD (  22.54  )
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

T24gU2F0LCBKdWwgMjksIDIwMjMgYXQgMjozMeKAr0FNIERhbmllbCBIZW5yaXF1ZSBCYXJib3ph
CjxkYmFyYm96YUB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IEtWTSB1c2Vyc3BhY2VzIG5l
ZWQgdG8gYmUgYXdhcmUgb2YgdGhlIGhvc3QgU0FUUCB0byBhbGxvdyB0aGVtIHRvCj4gYWR2ZXJ0
aXNlIGl0IGJhY2sgdG8gdGhlIGd1ZXN0IE9TLgo+Cj4gU2luY2UgdGhpcyBpbmZvcm1hdGlvbiBp
cyB1c2VkIHRvIGJ1aWxkIHRoZSBndWVzdCBGRFQgd2UgY2FuJ3Qgd2FpdCBmb3IKPiB0aGUgU0FU
UCByZWcgdG8gYmUgcmVhZGFibGUuIFdlIGp1c3QgbmVlZCB0byByZWFkIHRoZSBTQVRQIG1vZGUs
IHRodXMKPiB3ZSBjYW4gdXNlIHRoZSBleGlzdGluZyAnc2F0cF9tb2RlJyBnbG9iYWwgdGhhdCBy
ZXByZXNlbnRzIHRoZSBTQVRQIHJlZwo+IHdpdGggTU9ERSBzZXQgYW5kIGJvdGggQVNJRCBhbmQg
UFBOIGNsZWFyZWQuIEUuZy4gZm9yIGEgMzIgYml0IGhvc3QKPiBydW5uaW5nIHdpdGggc3YzMiBz
YXRwX21vZGUgaXMgMHg4MDAwMDAwMCwgZm9yIGEgNjQgYml0IGhvc3QgcnVubmluZwo+IHN2NTcg
c2F0cF9tb2RlIGlzIDB4YTAwMDAwMDAwMDAwMDAwMCwgYW5kIHNvIG9uLgo+Cj4gQWRkIGEgbmV3
IHVzZXJzcGFjZSB2aXJ0dWFsIGNvbmZpZyByZWdpc3RlciAnc2F0cF9tb2RlJyB0byBhbGxvdwo+
IHVzZXJzcGFjZSB0byByZWFkIHRoZSBjdXJyZW50IFNBVFAgbW9kZSB0aGUgaG9zdCBpcyB1c2lu
ZyB3aXRoCj4gR0VUX09ORV9SRUcgQVBJIGJlZm9yZSBzcGlubmluZyB0aGUgdmNwdS4KPgo+ICdz
YXRwX21vZGUnIGNhbid0IGJlIGNoYW5nZWQgdmlhIEtWTSwgc28gU0VUX09ORV9SRUcgaXMgYWxs
b3dlZCBhcyBsb25nCj4gYXMgdXNlcnNwYWNlIHdyaXRlcyB0aGUgZXhpc3RpbmcgJ3NhdHBfbW9k
ZScuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgSGVucmlxdWUgQmFyYm96YSA8ZGJhcmJvemFA
dmVudGFuYW1pY3JvLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVu
dGFuYW1pY3JvLmNvbT4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjYKClRoYW5rcywK
QW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCAgICAgIHwgMiArKwo+
ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20va3ZtLmggfCAxICsKPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdV9vbmVyZWcuYyAgICAgIHwgNyArKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3Ny
LmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oCj4gaW5kZXggN2JhYzQzYTMxNzZlLi43
NzdjYjgyOTk1NTEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+
ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPiBAQCAtNTQsNiArNTQsNyBAQAo+
ICAjaWZuZGVmIENPTkZJR182NEJJVAo+ICAjZGVmaW5lIFNBVFBfUFBOICAgICAgIF9BQygweDAw
M0ZGRkZGLCBVTCkKPiAgI2RlZmluZSBTQVRQX01PREVfMzIgICBfQUMoMHg4MDAwMDAwMCwgVUwp
Cj4gKyNkZWZpbmUgU0FUUF9NT0RFX1NISUZUICAgICAgICAzMQo+ICAjZGVmaW5lIFNBVFBfQVNJ
RF9CSVRTIDkKPiAgI2RlZmluZSBTQVRQX0FTSURfU0hJRlQgICAgICAgIDIyCj4gICNkZWZpbmUg
U0FUUF9BU0lEX01BU0sgX0FDKDB4MUZGLCBVTCkKPiBAQCAtNjIsNiArNjMsNyBAQAo+ICAjZGVm
aW5lIFNBVFBfTU9ERV8zOSAgIF9BQygweDgwMDAwMDAwMDAwMDAwMDAsIFVMKQo+ICAjZGVmaW5l
IFNBVFBfTU9ERV80OCAgIF9BQygweDkwMDAwMDAwMDAwMDAwMDAsIFVMKQo+ICAjZGVmaW5lIFNB
VFBfTU9ERV81NyAgIF9BQygweGEwMDAwMDAwMDAwMDAwMDAsIFVMKQo+ICsjZGVmaW5lIFNBVFBf
TU9ERV9TSElGVCAgICAgICAgNjAKPiAgI2RlZmluZSBTQVRQX0FTSURfQklUUyAxNgo+ICAjZGVm
aW5lIFNBVFBfQVNJRF9TSElGVCAgICAgICAgNDQKPiAgI2RlZmluZSBTQVRQX0FTSURfTUFTSyBf
QUMoMHhGRkZGLCBVTCkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNt
L2t2bS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gaW5kZXggOWMzNWUx
NDI3ZjczLi45OTJjNWU0MDcxMDQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL3Vh
cGkvYXNtL2t2bS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4g
QEAgLTU1LDYgKzU1LDcgQEAgc3RydWN0IGt2bV9yaXNjdl9jb25maWcgewo+ICAgICAgICAgdW5z
aWduZWQgbG9uZyBtYXJjaGlkOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBtaW1waWQ7Cj4gICAg
ICAgICB1bnNpZ25lZCBsb25nIHppY2Jvel9ibG9ja19zaXplOwo+ICsgICAgICAgdW5zaWduZWQg
bG9uZyBzYXRwX21vZGU7Cj4gIH07Cj4KPiAgLyogQ09SRSByZWdpc3RlcnMgZm9yIEtWTV9HRVRf
T05FX1JFRyBhbmQgS1ZNX1NFVF9PTkVfUkVHICovCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a3ZtL3ZjcHVfb25lcmVnLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gaW5kZXgg
MGRjMmMyY2VjYjQ1Li44NTc3M2U4NTgxMjAgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9vbmVyZWcuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiBAQCAt
MTUyLDYgKzE1Miw5IEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfZ2V0X3JlZ19jb25maWco
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NPTkZJ
R19SRUcobWltcGlkKToKPiAgICAgICAgICAgICAgICAgcmVnX3ZhbCA9IHZjcHUtPmFyY2gubWlt
cGlkOwo+ICAgICAgICAgICAgICAgICBicmVhazsKPiArICAgICAgIGNhc2UgS1ZNX1JFR19SSVND
Vl9DT05GSUdfUkVHKHNhdHBfbW9kZSk6Cj4gKyAgICAgICAgICAgICAgIHJlZ192YWwgPSBzYXRw
X21vZGUgPj4gU0FUUF9NT0RFX1NISUZUOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAg
ICAgIGRlZmF1bHQ6Cj4gICAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICAgICAgICAg
fQo+IEBAIC0yMzQsNiArMjM3LDEwIEBAIHN0YXRpYyBpbnQga3ZtX3Jpc2N2X3ZjcHVfc2V0X3Jl
Z19jb25maWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICAgICAgICAgICAgICAgICBlbHNlCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FQlVTWTsKPiAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4gKyAgICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfQ09ORklHX1JFRyhzYXRwX21vZGUp
Ogo+ICsgICAgICAgICAgICAgICBpZiAocmVnX3ZhbCAhPSAoc2F0cF9tb2RlID4+IFNBVFBfTU9E
RV9TSElGVCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAg
ICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgZGVmYXVsdDoKPiAgICAgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gICAgICAgICB9Cj4gLS0KPiAyLjQxLjAKPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

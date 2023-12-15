Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F566C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSYL+UkEZeqktliU1KeE0RCbHeCGu61O2vIGgrAPUoc=; b=KvtEto25odwi1X
	v6BoYBWop58pCmo5uTfzLBu5yokZRzzUnNwJW5s8z6raK4kD7CW3hXyvfkbSUqcdLvIZgq63HcGiZ
	KaV3GyV9XSb19P4GNc5cobEdG5y8T1Xc/4dVE8CeOK7+2+vjXKan+FkzjE7Fu7CidofKxvHEpd3HG
	ROUfv/+eDMJK9AbxfnaUaL9NAXjB/FNl2a0lVr/6atYb11bK777EEKqVrl4e9cct3aq1TAy+mR7o5
	3LRcpG1i1IAfQUwLMtkNKsuaaktT5b1Y32TFEGzyE0XM1w4oDul6Ld5P7CPQS5mAurphV+v8M/v7t
	oSo2F4+kHswnlxJ5rYhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4My-002bqj-2C;
	Fri, 15 Dec 2023 09:20:32 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4Mv-002bpV-1e
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 09:20:30 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-28b2ff2bbf0so239084a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 01:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1702632028; x=1703236828; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF0RjUxxOTCi/5O4/tSniADoZQ1plpiPzcoditI8TnU=;
        b=B+e8kAl20x1bPrrcTznCJdMMgU5Oi7DyAhoDO115Q551Y4oJzVb5g12ecRNgTHQknc
         nFvlQngCTmxWXTf8z8tq4Hdz1fZ1Oy+CLQEravrn0erEFtGfi51cHAxAuJSelrSJI73d
         R4sYSD6Fo4ucxU+af7yeAW2xOjKV026rhGmvXuxA4YhRDpv1crInbMhwSVYA/DiSxFFh
         R7GPfRxjssKxk2ciAp2qm9oocIzRGRoUQmZhI4rzyOVcTYGJ5/tUCXyBmrDJhS1r6nDT
         APrJTiutZQycwuwqiBkOccM10a5yYYBp/DsOs4LwNwmvRajPfzad/6+5Gu3LdNYP0m7m
         EIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702632028; x=1703236828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF0RjUxxOTCi/5O4/tSniADoZQ1plpiPzcoditI8TnU=;
        b=XtPMZskwLi9H+Wb6Cg+QcVX/SK8a4I73zJyqfb9kBIY7oOPXHC8FfkDXg4f0x8xva8
         9qkpXeVyKH83HiAtw9gCy67oteHP6BwXJKJ3MkELUZuiMUJH1UbsjL5+KRjgI8pA2RNT
         CdQOomefOPirfnX+gpk1vbDIDEDU5je6HSqPqtFgqeasDIwZFHDdr8IvEvY3VrSh7umx
         xH6G1MiQn5Pwm/agvfMPs66JNqlcwapMI2crn3Oy8a+xUapGQqrOVlfeHQDSsJU+BBMC
         8dXelx3PE7m1FT03qhWkXbas3jHh4Lah3ImF4nuOz0JpKtWb3ZfJNgNHYzA/9kp9NDte
         H/og==
X-Gm-Message-State: AOJu0YwRWjuhW5R4RWRmmk3snGsH2SFGFS0LCqn/yVpLi60ZrNp0nQGl
	QVT0FPVvpeg5K8DPgLJAndd/veCrF1bmwwINJMvaNQ==
X-Google-Smtp-Source: AGHT+IGGe7wky7OlkN2qh8RmXDPOO5hC4CA5PgO96asXf3UXjlQvMc2HzBQriu2xmybz2VFFlOT2JhtYC9rkne0rj5s=
X-Received: by 2002:a17:90a:578c:b0:285:cc9c:7406 with SMTP id
 g12-20020a17090a578c00b00285cc9c7406mr8945022pji.15.1702632028011; Fri, 15
 Dec 2023 01:20:28 -0800 (PST)
MIME-Version: 1.0
References: <20231214101552.100721-15-ajones@ventanamicro.com> <20231214101552.100721-25-ajones@ventanamicro.com>
In-Reply-To: <20231214101552.100721-25-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 Dec 2023 14:50:15 +0530
Message-ID: <CAAhSdy1_ufRyGc3gBkV8FKBD8zZ_SwNnz6a6xct31NmuDZYssw@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] RISC-V: KVM: selftests: Move sbi_ecall to processor.c
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_012029_548532_23738C94 
X-CRM114-Status: GOOD (  13.55  )
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

T24gVGh1LCBEZWMgMTQsIDIwMjMgYXQgMzo0NuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gc2JpX2VjYWxsKCkgaXNuJ3QgdWNhbGwgc3BlY2lm
aWMgYW5kIGl0cyBwcm90b3R5cGUgaXMgYWxyZWFkeSBpbgo+IHByb2Nlc3Nvci5oLiBNb3ZlIGl0
cyBpbXBsZW1lbnRhdGlvbiB0byBwcm9jZXNzb3IuYy4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFu
dXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmcKClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIC4u
Li9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyAgICAgICB8IDI2ICsrKysrKysr
KysrKysrKysrKysKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2Fs
bC5jIHwgMjYgLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2Vy
dGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gaW5kZXggNmMyNWY3ODQzZWY0Li42OTA1
YTQzNDgzODAgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9y
aXNjdi9wcm9jZXNzb3IuYwo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIv
cmlzY3YvcHJvY2Vzc29yLmMKPiBAQCAtMzY3LDMgKzM2NywyOSBAQCB2b2lkIHZjcHVfYXJnc19z
ZXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgbnVtLCAuLi4pCj4gIHZvaWQg
YXNzZXJ0X29uX3VuaGFuZGxlZF9leGNlcHRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7
Cj4gIH0KPiArCj4gK3N0cnVjdCBzYmlyZXQgc2JpX2VjYWxsKGludCBleHQsIGludCBmaWQsIHVu
c2lnbmVkIGxvbmcgYXJnMCwKPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25n
IGFyZzEsIHVuc2lnbmVkIGxvbmcgYXJnMiwKPiArICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwKPiArICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBsb25nIGFyZzUpCj4gK3sKPiArICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJf
dCBhMCBhc20gKCJhMCIpID0gKHVpbnRwdHJfdCkoYXJnMCk7Cj4gKyAgICAgICByZWdpc3RlciB1
aW50cHRyX3QgYTEgYXNtICgiYTEiKSA9ICh1aW50cHRyX3QpKGFyZzEpOwo+ICsgICAgICAgcmVn
aXN0ZXIgdWludHB0cl90IGEyIGFzbSAoImEyIikgPSAodWludHB0cl90KShhcmcyKTsKPiArICAg
ICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhMyBhc20gKCJhMyIpID0gKHVpbnRwdHJfdCkoYXJnMyk7
Cj4gKyAgICAgICByZWdpc3RlciB1aW50cHRyX3QgYTQgYXNtICgiYTQiKSA9ICh1aW50cHRyX3Qp
KGFyZzQpOwo+ICsgICAgICAgcmVnaXN0ZXIgdWludHB0cl90IGE1IGFzbSAoImE1IikgPSAodWlu
dHB0cl90KShhcmc1KTsKPiArICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhNiBhc20gKCJhNiIp
ID0gKHVpbnRwdHJfdCkoZmlkKTsKPiArICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhNyBhc20g
KCJhNyIpID0gKHVpbnRwdHJfdCkoZXh0KTsKPiArICAgICAgIHN0cnVjdCBzYmlyZXQgcmV0Owo+
ICsKPiArICAgICAgIGFzbSB2b2xhdGlsZSAoCj4gKyAgICAgICAgICAgICAgICJlY2FsbCIKPiAr
ICAgICAgICAgICAgICAgOiAiK3IiIChhMCksICIrciIgKGExKQo+ICsgICAgICAgICAgICAgICA6
ICJyIiAoYTIpLCAiciIgKGEzKSwgInIiIChhNCksICJyIiAoYTUpLCAiciIgKGE2KSwgInIiIChh
NykKPiArICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKyAgICAgICByZXQuZXJyb3IgPSBh
MDsKPiArICAgICAgIHJldC52YWx1ZSA9IGExOwo+ICsKPiArICAgICAgIHJldHVybiByZXQ7Cj4g
K30KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91
Y2FsbC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jCj4g
aW5kZXggZmU2ZDEwMDRmMDE4Li4xNGVlMTcxNTFhNTkgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jCj4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi91Y2FsbC5jCj4gQEAgLTEwLDMyICsxMCw2IEBACj4g
ICNpbmNsdWRlICJrdm1fdXRpbC5oIgo+ICAjaW5jbHVkZSAicHJvY2Vzc29yLmgiCj4KPiAtc3Ry
dWN0IHNiaXJldCBzYmlfZWNhbGwoaW50IGV4dCwgaW50IGZpZCwgdW5zaWduZWQgbG9uZyBhcmcw
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnMSwgdW5zaWduZWQg
bG9uZyBhcmcyLAo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYXJnMywg
dW5zaWduZWQgbG9uZyBhcmc0LAo+IC0gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgYXJnNSkKPiAtewo+IC0gICAgICAgcmVnaXN0ZXIgdWludHB0cl90IGEwIGFzbSAoImEwIikg
PSAodWludHB0cl90KShhcmcwKTsKPiAtICAgICAgIHJlZ2lzdGVyIHVpbnRwdHJfdCBhMSBhc20g
KCJhMSIpID0gKHVpbnRwdHJfdCkoYXJnMSk7Cj4gLSAgICAgICByZWdpc3RlciB1aW50cHRyX3Qg
YTIgYXNtICgiYTIiKSA9ICh1aW50cHRyX3QpKGFyZzIpOwo+IC0gICAgICAgcmVnaXN0ZXIgdWlu
dHB0cl90IGEzIGFzbSAoImEzIikgPSAodWludHB0cl90KShhcmczKTsKPiAtICAgICAgIHJlZ2lz
dGVyIHVpbnRwdHJfdCBhNCBhc20gKCJhNCIpID0gKHVpbnRwdHJfdCkoYXJnNCk7Cj4gLSAgICAg
ICByZWdpc3RlciB1aW50cHRyX3QgYTUgYXNtICgiYTUiKSA9ICh1aW50cHRyX3QpKGFyZzUpOwo+
IC0gICAgICAgcmVnaXN0ZXIgdWludHB0cl90IGE2IGFzbSAoImE2IikgPSAodWludHB0cl90KShm
aWQpOwo+IC0gICAgICAgcmVnaXN0ZXIgdWludHB0cl90IGE3IGFzbSAoImE3IikgPSAodWludHB0
cl90KShleHQpOwo+IC0gICAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gLQo+IC0gICAgICAgYXNt
IHZvbGF0aWxlICgKPiAtICAgICAgICAgICAgICAgImVjYWxsIgo+IC0gICAgICAgICAgICAgICA6
ICIrciIgKGEwKSwgIityIiAoYTEpCj4gLSAgICAgICAgICAgICAgIDogInIiIChhMiksICJyIiAo
YTMpLCAiciIgKGE0KSwgInIiIChhNSksICJyIiAoYTYpLCAiciIgKGE3KQo+IC0gICAgICAgICAg
ICAgICA6ICJtZW1vcnkiKTsKPiAtICAgICAgIHJldC5lcnJvciA9IGEwOwo+IC0gICAgICAgcmV0
LnZhbHVlID0gYTE7Cj4gLQo+IC0gICAgICAgcmV0dXJuIHJldDsKPiAtfQo+IC0KPiAgdm9pZCAq
dWNhbGxfYXJjaF9nZXRfdWNhbGwoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gICAgICAg
ICBzdHJ1Y3Qga3ZtX3J1biAqcnVuID0gdmNwdS0+cnVuOwo+IC0tCj4gMi40My4wCj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

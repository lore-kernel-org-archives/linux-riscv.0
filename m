Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6709BC83F1A
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lkGnZqYFLlAu0We6n+VvlLTPbvU96Y4FZs5H52KNbEk=; b=Wb4tFhizrqvtLm
	uG/rlP661qMmLhHRDhzX7KQSFfV62OIzlvWF4AaokvlORgRthIKceV4tW/Au80WI9ZeaTcj/z/czX
	7+dwIojcBta+I0rDneFPvXwDQvO8Mvkk/nvsELdSqI9cSrBV5V4U05K3AyBilv8n57RDgbYhUpaNV
	87NaOxWKfL+aAR1mLC/8o+xoQqQxG8aR5YzdCbrJGvYJXxEcBnlIzUpr+3Wnv10g/leSOqry6DrQa
	Tb4lHxeIGpjPjfE00+158X+K7WABBQ4f6dGo9QUIgygHAYIzWXH3YI8j1EiR4IfkPWEi5z157ocFR
	s7M1vp9uo6rhUuF82gDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHr5-00000009GfG-4AJP;
	Thu, 17 Jul 2025 06:12:31 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucHr2-00000009GdW-278R
	for linux-riscv@lists.infradead.org;
	Thu, 17 Jul 2025 06:12:30 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-879399faac9so45619839f.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Jul 2025 23:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1752732748; x=1753337548; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uee3oli5059CdqjZMZ5JHaAC2Fn9BWMJg270zgvkJfM=;
        b=TtF5elnf1y2Xyd3HTD/GuHmvhG1xadW7sqjHI8tqvDoCzi69OOk2ME4vuB324K1xti
         bqQZdb6PoimMSbf1iLAML6jZxzYA1gu06lC2sfZp1ZOmlORmwVDZRJmHjSzmNSaBeRGs
         7Gj1uv8UdV71EQ/o7sSSoc0jYXTz0orWF9UHwgi0KDDzQVXwk1cOCtIYbWduTpVSD2Gb
         zF8nBndeKn/WTSC/Fj7pRC39rtv7jclEniphr59/z735QwHTy1sjMOxFcp4mmHQFSFB7
         O66lLMOC5piyfpzJbyHYAbikCaA6DoBiq5klPCqFxu7r9kqPJLy2AIbXxERuB0InntsU
         CR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752732748; x=1753337548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uee3oli5059CdqjZMZ5JHaAC2Fn9BWMJg270zgvkJfM=;
        b=OZVlx2pPb+JU7TQ5JmeUyMd4Jh2V1MHcpFgLCrE/+FVueRJnD2tan0cnIPImv6/a3q
         +Mo84ohJT8o69pyxZBrRNSkj+oqT4b+A/Hf/1hL9fpK8dsjF+kGuOWAXKx1U4dt+1QI5
         XvazUCGqfQ7cDhwDwW3yVTf2+bYpnz8TV9QRvWq+HGPzR5KRZEpVA+HYzoCG8dWW3EAM
         zAJeGuwwoveFnIE1pTf8Z1IXbzwL7tt3ivx4o9dR8AOiBuJOeWgWZ5SLNMfgU9/g4fgb
         14ZWpNFEQUDPVN6fLRUJbtJKA4f1xHywrKhYtT34ZPLSTGyTS/QhSyzNoSSbwEZsHB8q
         nD/g==
X-Forwarded-Encrypted: i=1; AJvYcCUvvXtU3xVMhTiiYuKMPK/ZnWv3TMj38D7uVCZftHFygmYh/rZHAi+Am/PIlQgeHY7/YPkqgm+dzzPo7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5GfsqYu+tgFOwoAmoYYQoBk/3jFH9KQDHeVcEVRqC2UNeQEFm
	yroJcei2JYmUf6lTr5qTbvPWnzZU1q3HHB/+FX7TNV+FkEqlodNXyMVyIQBfCTl+Mb7Y9BDZ231
	Dy1IK/Q4lDdysnfA5EV31FZxFP8Qeqa4jIzjPrQ9CHw==
X-Gm-Gg: ASbGncv4rtZSFs4Dquys04wWcjc3T39rRsCvGDUeQHWYYjFffgiBEG7PEGOJjqjTDkU
	Ob/EVUArEDIOQrEZvqsuY4Vo1HMWNNI7zbxfH6fV+HxYt/8TJ7YwaprCKtiOsp64VtH/yhjXd+A
	UY79RulbTkOlW9UCF3uTVQqwxsr4BHm0Z8bzgFP3vFGgyTKulY/FeCn7EORPNuT6O0czo6Vrk7u
	r6XwQ==
X-Google-Smtp-Source: AGHT+IH8xcNIaMtG75XYnMN8W4vb5d0fFUQvseJHaY/XTWiJuHa1nEHEzpAjdB6OHrz4d8cQ5sLqYX8b9sjCFjfim50=
X-Received: by 2002:a05:6602:2d95:b0:875:b7b6:ae55 with SMTP id
 ca18e2360f4ac-879c08a1821mr619706139f.5.1752732747574; Wed, 16 Jul 2025
 23:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1749810735.git.zhouquan@iscas.ac.cn> <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
In-Reply-To: <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 17 Jul 2025 11:42:16 +0530
X-Gm-Features: Ac12FXxFyh1m_BsXZWN_jEHg_S_aVC3xq_tjAkTkzVkv4CVtzyvdpf1MklQXrzM
Message-ID: <CAAhSdy3aj_x02cpgxZDfn7tNu5HRfKA8VSZHpE1xJpY_2fABUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Add common supported test cases
To: zhouquan@iscas.ac.cn
Cc: ajones@ventanamicro.com, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_231228_550543_38093534 
X-CRM114-Status: GOOD (  14.27  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgNTowOOKAr1BNIDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4g
d3JvdGU6Cj4KPiBGcm9tOiBRdWFuIFpob3UgPHpob3VxdWFuQGlzY2FzLmFjLmNuPgo+Cj4gU29t
ZSBjb21tb24gS1ZNIHRlc3QgY2FzZXMgYXJlIHN1cHBvcnRlZCBvbiByaXNjdiBub3cgYXMgZm9s
bG93aW5nOgo+Cj4gICAgIGFjY2Vzc190cmFja2luZ19wZXJmX3Rlc3QKPiAgICAgZGVtYW5kX3Bh
Z2luZ190ZXN0Cj4gICAgIGRpcnR5X2xvZ19wZXJmX3Rlc3QKPiAgICAgZGlydHlfbG9nX3Rlc3QK
PiAgICAgZ3Vlc3RfcHJpbnRfdGVzdAo+ICAgICBrdm1fYmluYXJ5X3N0YXRzX3Rlc3QKPiAgICAg
a3ZtX2NyZWF0ZV9tYXhfdmNwdXMKPiAgICAga3ZtX3BhZ2VfdGFibGVfdGVzdAo+ICAgICBtZW1z
bG90X21vZGlmaWNhdGlvbl9zdHJlc3NfdGVzdAo+ICAgICBtZW1zbG90X3BlcmZfdGVzdAo+ICAg
ICByc2VxX3Rlc3QKPiAgICAgc2V0X21lbW9yeV9yZWdpb25fdGVzdAo+Cj4gQWRkIG1pc3Npbmcg
aGVhZGVycyBmb3IgdGVzdHMgYW5kIGZpeCBSSVNDVl9GRU5DRSByZWRlZmluaXRpb24KPiBpbiBg
cnNlcS1yaXNjdi5oYCBieSB1c2luZyB0aGUgZXhpc3RpbmcgbWFjcm8gZnJvbSA8YXNtL2ZlbmNl
Lmg+Lgo+Cj4gU2lnbmVkLW9mZi1ieTogUXVhbiBaaG91IDx6aG91cXVhbkBpc2Nhcy5hYy5jbj4K
ClBsZWFzZSBhZGRyZXNzIERyZXcncyBjb21tZW50cyBhbmQgc2VuZCB2MiBvZiBvbmx5IHRoaXMg
cGF0Y2guClRoZSBmaXJzdCBwYXRjaCBvZiB0aGlzIHNlcmllcyBpcyBhbHJlYWR5IHF1ZXVlZC4K
ClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtl
ZmlsZS5rdm0gICAgICAgICAgICAgfCAxMiArKysrKysrKysrKysKPiAgLi4uL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oICB8ICAyICsrCj4gIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNlcS1yaXNjdi5oICAgICAgICAgICAgfCAgMyArLS0KPiAg
MyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZS5rdm0gYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUua3ZtCj4gaW5kZXggMzhiOTU5OThlMWU2
Li41NjVlMTkxZTk5YzggMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L01ha2VmaWxlLmt2bQo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmls
ZS5rdm0KPiBAQCAtMTk3LDYgKzE5NywxOCBAQCBURVNUX0dFTl9QUk9HU19yaXNjdiArPSBhcmNo
X3RpbWVyCj4gIFRFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGNvYWxlc2NlZF9pb190ZXN0Cj4gIFRF
U1RfR0VOX1BST0dTX3Jpc2N2ICs9IGdldC1yZWctbGlzdAo+ICBURVNUX0dFTl9QUk9HU19yaXNj
diArPSBzdGVhbF90aW1lCj4gK1RFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGFjY2Vzc190cmFja2lu
Z19wZXJmX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gZGVtYW5kX3BhZ2luZ190ZXN0
Cj4gK1RFU1RfR0VOX1BST0dTX3Jpc2N2ICs9IGRpcnR5X2xvZ19wZXJmX3Rlc3QKPiArVEVTVF9H
RU5fUFJPR1NfcmlzY3YgKz0gZGlydHlfbG9nX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3Yg
Kz0gZ3Vlc3RfcHJpbnRfdGVzdAo+ICtURVNUX0dFTl9QUk9HU19yaXNjdiArPSBrdm1fYmluYXJ5
X3N0YXRzX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0ga3ZtX2NyZWF0ZV9tYXhfdmNw
dXMKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0ga3ZtX3BhZ2VfdGFibGVfdGVzdAo+ICtURVNU
X0dFTl9QUk9HU19yaXNjdiArPSBtZW1zbG90X21vZGlmaWNhdGlvbl9zdHJlc3NfdGVzdAo+ICtU
RVNUX0dFTl9QUk9HU19yaXNjdiArPSBtZW1zbG90X3BlcmZfdGVzdAo+ICtURVNUX0dFTl9QUk9H
U19yaXNjdiArPSByc2VxX3Rlc3QKPiArVEVTVF9HRU5fUFJPR1NfcmlzY3YgKz0gc2V0X21lbW9y
eV9yZWdpb25fdGVzdAo+Cj4gIFRFU1RfR0VOX1BST0dTX2xvb25nYXJjaCArPSBjb2FsZXNjZWRf
aW9fdGVzdAo+ICBURVNUX0dFTl9QUk9HU19sb29uZ2FyY2ggKz0gZGVtYW5kX3BhZ2luZ190ZXN0
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2
L3Byb2Nlc3Nvci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3Yv
cHJvY2Vzc29yLmgKPiBpbmRleCAxNjJmMzAzZDlkYWEuLjRjZjVhZTExNzYwZiAxMDA2NDQKPiAt
LS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3Iu
aAo+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nl
c3Nvci5oCj4gQEAgLTksNyArOSw5IEBACj4KPiAgI2luY2x1ZGUgPGxpbnV4L3N0cmluZ2lmeS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ICsjaW5jbHVkZSA8YXNtL3Zkc28vcHJvY2Vzc29y
Lmg+Cj4gICNpbmNsdWRlICJrdm1fdXRpbC5oIgo+ICsjaW5jbHVkZSAidWNhbGxfY29tbW9uLmgi
Cj4KPiAgI2RlZmluZSBJTlNOX09QQ09ERV9NQVNLICAgICAgIDB4MDA3Ywo+ICAjZGVmaW5lIElO
U05fT1BDT0RFX1NISUZUICAgICAgMgo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9yc2VxL3JzZXEtcmlzY3YuaCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNl
cS1yaXNjdi5oCj4gaW5kZXggNjdkNTQ0YWFhOWEzLi4wNmM4NDBlODFjOGIgMTAwNjQ0Cj4gLS0t
IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnNlcS9yc2VxLXJpc2N2LmgKPiArKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yc2VxL3JzZXEtcmlzY3YuaAo+IEBAIC04LDYgKzgsNyBAQAo+
ICAgKiBleGNlcHRpb24gd2hlbiBleGVjdXRlZCBpbiBhbGwgbW9kZXMuCj4gICAqLwo+ICAjaW5j
bHVkZSA8ZW5kaWFuLmg+Cj4gKyNpbmNsdWRlIDxhc20vZmVuY2UuaD4KPgo+ICAjaWYgZGVmaW5l
ZChfX0JZVEVfT1JERVIpID8gKF9fQllURV9PUkRFUiA9PSBfX0xJVFRMRV9FTkRJQU4pIDogZGVm
aW5lZChfX0xJVFRMRV9FTkRJQU4pCj4gICNkZWZpbmUgUlNFUV9TSUcgICAweGYxNDAxMDczICAv
KiBjc3JyIG1oYXJ0aWQsIHgwICovCj4gQEAgLTI0LDggKzI1LDYgQEAKPiAgI2RlZmluZSBSRUdf
TCAgX19SRUdfU0VMKCJsZCAiLCAibHcgIikKPiAgI2RlZmluZSBSRUdfUyAgX19SRUdfU0VMKCJz
ZCAiLCAic3cgIikKPgo+IC0jZGVmaW5lIFJJU0NWX0ZFTkNFKHAsIHMpIFwKPiAtICAgICAgIF9f
YXNtX18gX192b2xhdGlsZV9fICgiZmVuY2UgIiAjcCAiLCIgI3MgOiA6IDogIm1lbW9yeSIpCj4g
ICNkZWZpbmUgcnNlcV9zbXBfbWIoKSAgUklTQ1ZfRkVOQ0UocncsIHJ3KQo+ICAjZGVmaW5lIHJz
ZXFfc21wX3JtYigpIFJJU0NWX0ZFTkNFKHIsIHIpCj4gICNkZWZpbmUgcnNlcV9zbXBfd21iKCkg
UklTQ1ZfRkVOQ0UodywgdykKPiAtLQo+IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

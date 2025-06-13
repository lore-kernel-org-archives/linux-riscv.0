Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849B1C61CE8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 01:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=crV98RD0WlL/cB1G9VxJCQq3jm2dTbfCeIJRcL1sEOs=; b=CoB7Izi/Ao55MO
	YzvYAmzLK/VUm0pLvoMOEdCI8KYpYWJM3/rdYuNRGpnf8ZqQzlFuOMdpZFFbNokub7B0a3HFnwHTA
	altBQ6fMbCFPPLRu34W1U4CrJWRjV9sKGSXDwcxdpzOpMxeEFp+ONkx6oYc25bc9JKrRmlmW/s9nc
	S4aXnSDp9IpfWgumSaem9yKGeBTVn0/1Rt8bnIW9U4q4AoqUY+pr3S0mf+G5wHf4A07myI9kfTluV
	3t1v6NjchJvpoU9JNKILly9tYQtNkAp46t5MQ/sXlPPd0CJTMImJfMvlYQcTOgpOg3jTvzOcBMqIE
	aJqgoT5gLl9M/O+tpejA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsuE-0000000F1IL-49CX;
	Fri, 13 Jun 2025 01:08:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsuD-0000000F1Hz-0HS2
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 01:08:30 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-451d3f72391so20949665e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 18:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1749776907; x=1750381707; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV/+ZQq5RzgkIE87cL2HuuOvaHTwwG97pZ4IkkoLaPM=;
        b=Hkmsc1xeBPSQdcGoJZFg2ghn1lWcK33kUCKdDnwSj6BqjuoLIDQCYN+4wRwyXdMDQf
         GLSA7Lg1xjkCqiBszcxedY1CxaFuGBMzuse6GhxtPFrplWUXlRn8CqEjSSQac+OElet2
         sas6Z9Rf99pRsBBIEPz2Duxgc6pTo463To+Xn3mWCNw+cMjxMCBTxDTl5mvhvdbhcPGv
         sO+wfQfprO2kMRYQZsyB1bTmbOA1y6sAL3t4M+1gAdPMNkx+X5SvC2qHjaLM1UevSfWb
         51lTxMIz3APVhSO41oAzNphhKU68U5QDqzGX8AbNWsHj0/6wTYk/8y194N3WcZpDPvKZ
         9EFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749776907; x=1750381707;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yV/+ZQq5RzgkIE87cL2HuuOvaHTwwG97pZ4IkkoLaPM=;
        b=f35yLDfsGv6oMnK8imDG2v/Szfysw9+pAl7lQ82zs8CGcfnfgh8+LUOo5gEWTgZMCY
         B/PBnNl3E4sG7h+XHw1/FtLOo5OWMTxbMU1bOt419vMPd+ur/veB7lVewxDBSGvCJBp5
         8pX61hSjsUeUfKc5yNIdp0xGVr1i0YCNBECtRabfvYCn3xNAK09TQmaN01sY+ZVE0hm/
         Qs51bAmrWxZ2PBcFy+JmmwFTHbHn7EFya2OqXSe25ZfMU1Ad7ZSqE/AYTuG+AxSlZYII
         X17elBS3i3N/MwHZoG8tMAXLvV8TIhUZ7EMQKWgVbm7DmBEh71Hcl6+/vswj4PabUiI+
         F0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCX689MIoJ7OpETKz6kc+grrqY4WY+6hvnSyqN0y3BHpDSvk73Isgw/xtoz6CVyDvoZfZPYt/O7q+GTLSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxUC82xH0s4uYsdibmQ8nxT+oY8DRT6iPrQxmn6+kQabAtkcDs
	cWzNrLgnljImvFWu77Z6P/0VcaszTMMKaxGrgFelNxX3QMBYf20Kg7y+/pxOCaV+mnI=
X-Gm-Gg: ASbGncsiresZm5rtViufxpa8e6wwDCdWbfUy+O/43mhBlr6LcLc06OCLgRIPFYvjcey
	Qr8mqxVijJX9wsqN4QjYTPSHQyRLn9qdvJ3BofCG7ZsLMfBcNtoj8YwGOlQ03H/RLX9dLUWaPVn
	ascPbzS5F8ZYYgv7cOkwimHs1v0SKL4ZFhCy5QS/ij4awPGyPq+5gcHYhz8t7e2qnLuhl5ccWHY
	gbSX9qKui25TBgF/ntodY5IuajqYtG9BI8bSN9jszjMiiwEIokd9ILCWkqyyZStACje2ZgRxmug
	oAoCCmlxUM9mWGER6kchZzoxrU7pjrZuK+a8C5iYK3U/QuYlJaq/DDruoEH1axWrV0KhOPHppGk
	=
X-Google-Smtp-Source: AGHT+IFwyw9OHP+fZV6LAbNr0tT5uZJzpkB6b4K/Ns4tGf9uKmcXDtKWoPd0LKrnrhtueMGufyguFg==
X-Received: by 2002:a05:600c:1c12:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-45334b5ae3cmr9341235e9.30.1749776906902;
        Thu, 12 Jun 2025 18:08:26 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm35282755e9.20.2025.06.12.18.08.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jun 2025 18:08:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <mhng-4BA05CCD-6D5A-4067-B88A-DEBD4FCDED77@palmerdabbelt-mac>
Date: Fri, 13 Jun 2025 02:08:14 +0100
Cc: Alexandre Ghiti <alex@ghiti.fr>,
 thomas.weissschuh@linutronix.de,
 Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu,
 nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com,
 morbo@google.com,
 justinstitt@google.com,
 luto@kernel.org,
 tglx@linutronix.de,
 vincenzo.frascino@arm.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <20ED8855-2A51-4821-9675-EF45041BCD31@jrtc27.com>
References: <mhng-4BA05CCD-6D5A-4067-B88A-DEBD4FCDED77@palmerdabbelt-mac>
To: Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_180829_125104_D45201FB 
X-CRM114-Status: GOOD (  25.66  )
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

T24gMTIgSnVuIDIwMjUsIGF0IDIxOjA1LCBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRhYmJlbHQu
Y29tPiB3cm90ZToKPiAKPiBPbiBUaHUsIDEyIEp1biAyMDI1IDAxOjMxOjIwIFBEVCAoLTA3MDAp
LCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IEhpIFRob21hcywKPj4gCj4+IE9uIDYvMTEvMjUg
MTE6MjIsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+Pj4gQWxsIHZEU08gY29kZSBuZWVkcyB0
byBiZSBjb21wbGV0ZWx5IHBvc2l0aW9uIGluZGVwZW5kZW50Lgo+Pj4gU3ltYm9sIHJlZmVyZW5j
ZXMgYXJlIG1hcmtlZCBhcyBoaWRkZW4gc28gdGhlIGNvbXBpbGVyIGVtaXRzCj4+PiBQQy1yZWxh
dGl2ZSByZWxvY2F0aW9ucy4gSG93ZXZlciB0aGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhlIGNvbXBp
bGVyIG1heQo+Pj4gc3RpbGwgZW1pdCBhYnNvbHV0ZSByZWxvY2F0aW9ucywgYXMgdGhleSBhcmUg
dmFsaWQgaW4gcmVndWxhciBQSUMgRFNPIGNvZGUuCj4+PiBUaGVzZSB3b3VsZCBiZSByZXNvbHZl
ZCBieSB0aGUgbGlua2VyIGFuZCB3aWxsIGJyZWFrIGF0IHJ1bnRpbWUuCj4+PiBUaGlzIGhhcyBi
ZWVuIG9ic2VydmVkIG9uIGFybTY0IHVuZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcywgc2VlCj4+PiBj
b21taXQgMGMzMTRjZGE5MzI1ICgiYXJtNjQ6IHZkc286IFdvcmsgYXJvdW5kIGludmFsaWQgYWJz
b2x1dGUgcmVsb2NhdGlvbnMgZnJvbSBHQ0MiKQo+Pj4gCj4+PiBJbnRyb2R1Y2UgYSBidWlsZC10
aW1lIGNoZWNrIGZvciBhYnNvbHV0ZSByZWxvY2F0aW9ucy4KPj4+IFRoZSBjaGVjayBpcyBkb25l
IG9uIHRoZSBvYmplY3QgZmlsZXMgYXMgdGhlIHJlbG9jYXRpb25zIHdpbGwgbm90IGV4aXN0Cj4+
PiBhbnltb3JlIGluIHRoZSBmaW5hbCBEU08uIEFzIHRoZXJlIGlzIG5vIGV4dGVuc2lvbiBwb2lu
dCBmb3IgdGhlCj4+PiBjb21waWxhdGlvbiBvZiBlYWNoIG9iamVjdCBmaWxlLCBwZXJmb3JtIHRo
ZSB2YWxpZGF0aW9uIGluIHZkc29fY2hlY2suCj4+PiAKPj4+IERlYnVnIGluZm9ybWF0aW9uIGNh
biBjb250YWluIGxlZ2FsIGFic29sdXRlIHJlbG9jYXRpb25zIGFuZCByZWFkZWxmIGNhbgo+Pj4g
bm90IHByaW50IHJlbG9jYXRpb25zIGZyb20gdGhlIC50ZXh0IHNlY3Rpb24gb25seS4gTWFrZSB1
c2Ugb2YgdGhlIGZhY3QKPj4+IHRoYXQgYWxsIGdsb2JhbCB2RFNPIHN5bWJvbHMgZm9sbG93IHRo
ZSBuYW1pbmcgcGF0dGVybiAidmRzb191XyIuCj4+PiAKPj4+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xrbWwvYUFwR1BBb2N0cV9lb0UyZ0B0MTR1bHRyYS8KPj4+IExpbms6IGh0dHBz
Oi8vZ2NjLmdudS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTEyMDAwMgo+Pj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPHRob21hcy53ZWlzc3NjaHVoQGxpbnV0cm9uaXgu
ZGU+Cj4+PiAtLS0KPj4+ICBsaWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlIHwgNiArKysrKysKPj4+
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+PiAKPj4+IGRpZmYgLS1naXQgYS9s
aWIvdmRzby9NYWtlZmlsZS5pbmNsdWRlIGIvbGliL3Zkc28vTWFrZWZpbGUuaW5jbHVkZQo+Pj4g
aW5kZXggY2VkYmYxNWY4MDg3NGQ0YmIyN2MwOTcyNDRiYzViMTEyNzJmMjYxYy4uMDQyNTdkMGYy
OGMwZWQzMjRlMzFhZGJiNjg0OTcxODEwODU3NTJmOCAxMDA2NDQKPj4+IC0tLSBhL2xpYi92ZHNv
L01ha2VmaWxlLmluY2x1ZGUKPj4+ICsrKyBiL2xpYi92ZHNvL01ha2VmaWxlLmluY2x1ZGUKPj4+
IEBAIC0xMiw3ICsxMiwxMyBAQCBjLWdldHJhbmRvbS0kKENPTkZJR19WRFNPX0dFVFJBTkRPTSkg
Oj0gJChhZGRwcmVmaXggJChHRU5FUklDX1ZEU09fRElSKSwgZ2V0cmFuZAo+Pj4gICMKPj4+ICAj
IEFzIGEgd29ya2Fyb3VuZCBmb3Igc29tZSBHTlUgbGQgcG9ydHMgd2hpY2ggcHJvZHVjZSB1bm5l
ZWRlZCBSXypfTk9ORQo+Pj4gICMgZHluYW1pYyByZWxvY2F0aW9ucywgaWdub3JlIFJfKl9OT05F
Lgo+Pj4gKyMKPj4+ICsjIEFsc28gdmFsaWRhdGUgdGhhdCBubyBhYnNvbHV0ZSByZWxvY2F0aW9u
cyBhZ2FpbnN0IGdsb2JhbCBzeW1ib2xzIGFyZSBwcmVzZW50Cj4+PiArIyBpbiB0aGUgb2JqZWN0
IGZpbGVzLgo+Pj4gIHF1aWV0X2NtZF92ZHNvX2NoZWNrID0gVkRTT0NISyAkQAo+Pj4gICAgICAg
IGNtZF92ZHNvX2NoZWNrID0gaWYgJChSRUFERUxGKSAtclcgJEAgfCBncmVwIC12IF9OT05FIHwg
Z3JlcCAtcSAiIFJfXHcqXyI7IFwKPj4+ICAgICAgICAgIHRoZW4gKGVjaG8gPiYyICIkQDogZHlu
YW1pYyByZWxvY2F0aW9ucyBhcmUgbm90IHN1cHBvcnRlZCI7IFwKPj4+ICsgICAgICBybSAtZiAk
QDsgL2Jpbi9mYWxzZSk7IGZpICYmIFwKPj4+ICsgICAgICAgIGlmICQoUkVBREVMRikgLXJXICQo
ZmlsdGVyICUubywgJChyZWFsLXByZXJlcXMpKSB8IGdyZXAgLXEgIiBSX1x3Kl9BQlMuKnZkc29f
dV8iOyBcCj4+IAo+PiAKPj4gVGhpcyBvbmx5IHdvcmtzIGZvciBhcm02NCByZWxvY2F0aW9ucyBy
aWdodD8gSSBjYW4ndCBmaW5kIGFueSAqQUJTKgo+PiByZWxvY2F0aW9ucyBpbiByaXNjdiBlbGYg
YWJpCj4+IChodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1lbGYtcHNhYmkt
ZG9jL3JlbGVhc2VzL3RhZy92MS4wKS4KPiAKPiBUaGF0J3MgYmVjYXVzZSB0aGUgcHNBQkkgcGVv
cGxlIGRvIG5vdCBiZWxpZXZlIGluIGFic29sdXRlIHN5bWJvbHMuCgpJIGRvbuKAmXQga25vdyB3
aGF0IHlvdeKAmXJlIHJlZmVycmluZyB0byBoZXJlLiBBYnNvbHV0ZSBzeW1ib2xzIChTSE5fQUJT
CnJhdGhlciB0aGFuIGEgcmVhbCBzZWN0aW9uIGluZGV4KSBhcmUgZGlmZmVyZW50IHRvIGFic29s
dXRlCnJlbG9jYXRpb25zLiBUaGUgY29kZSBoZXJlIGlzIGNoZWNraW5nIGZvciAqcmVsb2NhdGlv
bnMqLCBub3Qgc3ltYm9scy4KUklTQy1WIGhhcyBhYnNvbHV0ZSByZWxvY2F0aW9ucywgdGhleeKA
mXJlIFJfUklTQ1ZfMzIvNjQuIFB1dHRpbmcgQUJTIGluCnRoZSByZWxvY2F0aW9uIG5hbWUgaXMg
YW4gQXJtLWlzbSB0aGF0IG90aGVyIGFyY2hpdGVjdHVyZXMgZG9u4oCZdCBkby4KQWJzb2x1dGUg
YWRkcmVzc2luZyBleGlzdHMsIGFzIHRoZSBtZWRsb3cgYW5kIGxhcmdlIGNvZGUgbW9kZWxzICh3
aXRoCi1mbm8tcGljL1BJQy9waWUvUElFKS4gU28gSeKAmW0gcmVhbGx5IG5vdCBzdXJlIHdoYXQg
eW914oCZcmUgc2F5aW5nIHRoZQpjdXJyZW50IHBzQUJJIGRvZXNu4oCZdCBkbyB0aGF0IGl0IHNo
b3VsZCwgbm9yIHdoYXQgZGlzY3Vzc2lvbnMgeW914oCZcmUKZXZlbiBzdWdnZXN0aW5nIGhhdmUg
aGFwcGVuZWQgYW5kIGJlZW4gZGlzbWlzc2VkPwoKUGVyaGFwcyB5b3XigJlyZSByZWZlcnJpbmcg
dG8gdGhlIGRpZmZpY3VsdHkgb2YgdXNpbmcgUEMtcmVsYXRpdmUKYWNjZXNzZXMgYWdhaW5zdCBh
YnNvbHV0ZSBzeW1ib2xzLCBhcyB5b3XigJlsbCBnZXQgaW4gbWVkYW55IGFuZCBQSUUKY29kZT8g
QnV0IHRoYXTigJlzIHNvbWV0aGluZyB0aGF0IGFmZmVjdHMgbWFueSBhcmNoaXRlY3R1cmVzOyB5
b3UgY2FuCmhhdmUgaXNzdWVzIG9uIGFtZDY0IGFuZCBhYXJjaDY0LCBub3QganVzdCByaXNjdjY0
LgoKSmVzc2ljYQoKPiBUaGV5IGV4aXN0IGluIHRoZSBhY3R1YWwgdG9vbGNoYWlucywgdGhvdWdo
LCBhcyB0aGV5IGFyZSBwYXJ0IG9mIHRoZSBnZW5lcmljIEVMRiBBQkkuIEluIHRoZW9yeSB0aGV5
J2Qgd29yayBmaW5lIGluIHRoZSBWRFNPIGFzIGxvbmcgYXMgd2UncmUgdXNpbmcgYWJzb2x1dGUg
YWRkcmVzc2luZyBpbnN0cnVjdGlvbnMgZm9yIHRoZW0sIHdoaWNoIGlzIHBvc3NpYmxlIHRvIGRv
IChhbmQgSSB0aGluayBzaG91bGQgaGFwcGVuIGZvciBzb21lIGdsb2JhbCBzeW1ib2xzKS4KPiAK
PiBUaGF0IHNhaWQsIGl0IGRvZXNuJ3QgcmVhbGx5IHNlZW0gd29ydGggdGhlIGVmZm9ydCB0byBn
ZXQgdGhlIGNoZWNraW5nIG1vcmUgZmluZS1ncmFpbmVkIGhlcmUuICBJIGRvbid0IHNlZSBhbnkg
cmVhc29uIHdlJ2QgbmVlZCBhbiBhYnNvbHV0ZSBzeW1ib2wgaW4gdGhlIFZEU08sIHNvIHVuaWwg
c29tZW9uZSBoYXMgb25lIHdlIG1pZ2h0IGFzIHdlbGwganVzdCBmb3JiaWQgdGhlbSBlbnRpcmVs
eS4KPiAKPiBTb21lIG9sZCB0b29sY2hhaW5zIGhhZCBhbiBhYnNvbHV0ZSAiX19nbG9hYmxfcG9p
bnRlciQiIGZsb2F0aW5nIGFyb3VuZCBzb21lIG9mIHRoZSBDUlQgZmlsZXMsIHNvIHdlIG1pZ2h0
IHRyaXAgb3ZlciBidWdzIGhlcmUuICBJIHRoaW5rIHdlJ3JlIHNhZmUgYXMgdGhvc2Ugc2hvdWxk
bid0IHNob3cgdXAgaW4gdGhlIFZEU08sIGJ1dCBub3QgMTAwJSBzdXJlLiAgUHJvYmFibHkgYmVz
dCB0byBnZXQgdGhpcyBvbiBuZXh0IHRvIGJha2UgZm9yIGEgYml0LCBqdXN0IHRvIG1ha2Ugc3Vy
ZSB3ZSdyZSBub3QgdHJpcHBpZyBhbnlvbmUgdXAuCj4gCj4+IFRoYW5rcywKPj4gCj4+IEFsZXgK
Pj4gCj4+IAo+Pj4gKyAgICAgICAgdGhlbiAoZWNobyA+JjIgIiRAOiBhYnNvbHV0ZSByZWxvY2F0
aW9ucyBhcmUgbm90IHN1cHBvcnRlZCI7IFwKPj4+ICAgICAgICBybSAtZiAkQDsgL2Jpbi9mYWxz
ZSk7IGZpCj4+PiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK

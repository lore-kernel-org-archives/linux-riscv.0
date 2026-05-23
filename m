Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C271CD5BB1
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2v9TQGpZD1FAHy9aW0J/fp7dxSudfjZRY4YgzJSrUW4=; b=AHkxrqaOhABIgf
	r6Z/UCxEOhlr/MkUzjSjbhNVflN/qNctXrK5kFObQFWfTGJUp++qlBWg0N4WB5j6Zgo5UlY0q3ojD
	spKLAu70JS6mDjgg7ChT37hBtcECg+vnpSGLDMLPhgEUQffr+uRXkM8sDLyDjQhEetEsSbrHKm4HC
	Zp8UcQ/8ykvf1PKZla/1HxDKgcDTPeTsbQRka3Bn4VX6Pf9JyQSzUYrzgDCvV6XExtblG4LRZg+QB
	3HP6Eqh4Vkj67Wp60YGWESolDZlyjU05TJfkfPAtgqeOVn2M9o+SkIVYpwk/d2woXdLKDUecqtnhR
	Zja9af0m3HpQ05RPbnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhLz-0000000CumL-1xil;
	Sat, 23 May 2026 08:05:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhLx-0000000CulF-0Puf
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 08:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779523500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/6lOELN7ZYTPndYRuMvfJzrgaHiXzqIeclIzONy8ARI=;
	b=MZvjh+jry4/6BLVx65iMh+2395Ds/Adbn5BzAmnKEGzCFlKUVDpKMqyC3nyg38O+APCSM/
	wzVRdzJujIwMcMW0Vh4B/vaFvQYazsYfFDFDc4WJLzsBGvCUXLdk8ArqGM3Qlez8cALd5/
	juduJhL/l1rdIe7+A2g4gHVrJisab5k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-7F274sM-MsKnr1sLVW1ncw-1; Sat, 23 May 2026 04:04:58 -0400
X-MC-Unique: 7F274sM-MsKnr1sLVW1ncw-1
X-Mimecast-MFC-AGG-ID: 7F274sM-MsKnr1sLVW1ncw_1779523497
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49051422d55so4717405e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 23 May 2026 01:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779523497; x=1780128297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/6lOELN7ZYTPndYRuMvfJzrgaHiXzqIeclIzONy8ARI=;
        b=bKnok3wlBlmzo3SeU3Z2WERQ4fLJOMyPWHXfJL08desNHKDqLVgIOLAT5ECUtNikFY
         NCF1THa9t6EVFSQC9CwPXLohU1yFb7Tz7EMeqZRkGiw+KDQSibPwaDslu8oTO4cMVJav
         cPhw+jhyDbF4rCqfry4D+P1rfbQwvV+qKsz+F3Tf4LSBkBNkJuwGKvVle+99Da8pFN7A
         wTToz0GS6Ls7ZVm7zeZMYHvbB166HNolriwz5s270prgEMussR7bca0m/WN9tmrU0P9B
         1o2BOzzucZFaJc//qbCKdJwB/enc7bPl3R2iBypnuShRCNeZnDZJix6p/Yg+s2Mg+5D6
         VTPA==
X-Forwarded-Encrypted: i=1; AFNElJ9WJztmBTFy6QrFqLInXg/uwn9zIE4iEoKNWg14XoSOshufH9EmycXLATGtm49JOuVQV0VtSaiWZa2CGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxozYG3MPl2PFLONrVCuGe/Wuj4Fsnti77xchppTlvybgYaTZrR
	drSLRDcbKzsZc1BokHb2QMG7rqKQuMvnTbuAWP4vwAtvzul8bC1baYpEndniU/XZzVhvEdRD2pD
	NxJG6OcEVLs0DR4dqjp5goRbn6bcMFjZkEeKFvPputI3m+H5izKLRQ6pjI/EaUFMENP8Wjngxo9
	+v+yd29+ubOIkxqeGWuOo3BvmzeYCGlCZuEjhtrUtMR+Dk
X-Gm-Gg: Acq92OH63gTNR6o4N93I53BfQ1xz6bkDN67Ynb1ua6wI+PKYxvGVlhGxrp0RTSOyxkl
	XCgN7L/todisDX/WF0WhexRa1r9rIr7L2CZd1Caoh6wk5qNt424qCyP1vgqGnKgjjSdJR4dAOxu
	AjGdmuPbIB+GXgvtPHCWOtiJ3x2/39g+u1YMYrk/QNZGAIVZH0tu4t27u9eeRPAh8/6ZQ95aAcm
	k6sfbPTBcNGXrvsmxcuUPkPD8M5FdFaOpXayxzRUjOLgzguG4w+hHeebuUgLgoVJx5C1+1D0Yga
	dVW4tdU=
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490428e03b8mr101727155e9.28.1779523497075;
        Sat, 23 May 2026 01:04:57 -0700 (PDT)
X-Received: by 2002:a05:600c:4510:b0:48f:d5a0:284e with SMTP id
 5b1f17b1804b1-490428e03b8mr101726795e9.28.1779523496671; Sat, 23 May 2026
 01:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0-joewqwsJNkMgzKvc0zh2cTFgTqdP+LZAAxmfEd+Mpw@mail.gmail.com>
In-Reply-To: <CAAhSdy0-joewqwsJNkMgzKvc0zh2cTFgTqdP+LZAAxmfEd+Mpw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 23 May 2026 10:04:44 +0200
X-Gm-Features: AVHnY4LmO1eiTue2Ym-q3YsTPGm0iPVz1DvdL1ekeTtanMGSUFVES61GYaQ5wM8
Message-ID: <CABgObfY4SnyfuXZXDvBOj7bWKTziHky8JRVSQ6-012x6TZV-EQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv fixes for 7.1 take #1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XbcmMuD_MtTeFBUXat4gx_g9QBaIxyWJiuWXORqXu0g_1779523497
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_010501_204089_22B009F2 
X-CRM114-Status: GOOD (  13.00  )
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

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMzowNuKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
Zml4ZXMgZm9yIHRoZSA3LjEga2VybmVsOgo+IDEpIEZpeCBpbnZhbGlkIEhWQSB3YXJuaW5nIGlu
IHN0ZWFsLXRpbWUgcmVjb3JkaW5nCj4gMikgUmV0dXJuIFNCSV9FUlJfRkFJTFVSRSB0byBndWVz
dCB1cG9uIE9PTSBpbgo+ICAgICBwbXVfZXZlbnRfaW5mbygpIGFuZCBwbXVfc25hcHNob3Rfc2V0
X3NobWVtKCkKPiAzKSBGaXggTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGluIFNCSSB2MC4xIFNF
TkRfSVBJIGhhbmRsZXIKPiA0KSBGaXggc2lnbiBleHRlbnNpb24gb2YgdmFsdWUgZm9yIE1NSU8g
bG9hZHMKPgo+IFBsZWFzZSBwdWxsLgo+Cj4gUmVnYXJkcywKPiBBbnVwCj4KPiBUaGUgZm9sbG93
aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDUyMDBmNWY0OTNmNzlmMTRiYmRjMzQ5ZTQwMmE0MGRm
YjMyZjIzYzg6Cj4KPiAgIExpbnV4IDcuMS1yYzQgKDIwMjYtMDUtMTcgMTM6NTk6NTggLTA3MDAp
Cj4KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKPgo+ICAgaHR0cHM6
Ly9naXRodWIuY29tL2t2bS1yaXNjdi9saW51eC5naXQgdGFncy9rdm0tcmlzY3YtZml4ZXMtNy4x
LTEKPgo+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byBjNzgzMjUzNGE4MTYwMjc2Y2Nj
YjlhOGNjOGNhZmI1NjE0YzU3OWQwOgo+Cj4gICBSSVNDLVY6IEtWTTogRml4IHNpZ24gZXh0ZW5z
aW9uIGZvciBNTUlPIGxvYWRzICgyMDI2LTA1LTE4IDEwOjE5OjE4ICswNTMwKQoKUHVsbGVkLCB0
aGFua3MuCgpQYW9sbwoKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBLVk0vcmlzY3YgZml4ZXMgZm9yIDcuMSwgdGFr
ZSAjMQo+Cj4gLSBGaXggaW52YWxpZCBIVkEgd2FybmluZyBpbiBzdGVhbC10aW1lIHJlY29yZGlu
Zwo+IC0gUmV0dXJuIFNCSV9FUlJfRkFJTFVSRSB0byBndWVzdCB1cG9uIE9PTSBpbiBwbXVfZXZl
bnRfaW5mbygpCj4gICBhbmQgcG11X3NuYXBzaG90X3NldF9zaG1lbSgpCj4gLSBGaXggTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIGluIFNCSSB2MC4xIFNFTkRfSVBJIGhhbmRsZXIKPiAtIEZpeCBz
aWduIGV4dGVuc2lvbiBvZiB2YWx1ZSBmb3IgTU1JTyBsb2Fkcwo+Cj4gLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEppYWth
aSBYdSAoMyk6Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBpbnZhbGlkIEhWQSB3YXJuaW5nIGlu
IHN0ZWFsLXRpbWUgcmVjb3JkaW5nCj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBOVUxMIHBvaW50
ZXIgZGVyZWZlcmVuY2UgaW4gU0JJIHYwLjEgU0VORF9JUEkgaGFuZGxlcgo+ICAgICAgIFJJU0Mt
VjogS1ZNOiBGaXggc2lnbiBleHRlbnNpb24gZm9yIE1NSU8gbG9hZHMKPgo+IE9zYW1hIEFiZGVs
a2FkZXIgKDIpOgo+ICAgICAgIHJpc2N2OiBrdm06IHJldHVybiBTQklfRVJSX0ZBSUxVUkUgZm9y
IHBtdV9zbmFwc2hvdF9zZXRfc2htZW0oKSB3aGVuIE9PTQo+ICAgICAgIHJpc2N2OiBrdm06IHJl
dHVybiBTQklfRVJSX0ZBSUxVUkUgZm9yIHBtdV9ldmVudF9pbmZvKCkgd2hlbiBPT00KPgo+ICBh
cmNoL3Jpc2N2L2t2bS92Y3B1X2luc24uYyAgICB8ICA5ICsrKystLS0tLQo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3BtdS5jICAgICB8IDEyICsrKysrKysrLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3NiaV9zdGEuYyB8ICAyICstCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3YwMS5jIHwg
IDIgKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMo
LSkKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

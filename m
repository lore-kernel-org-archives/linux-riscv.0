Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06807CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Of9uArtRkuQ9/oh9cljSPl/ipOuvsFp0kMjDF7x4L0=; b=QyQdMSZ+CX9Q+u
	m4gdY/15yd405Chsgm1JtuLG6Ql1M3fvUFtFfXRPdSCr9v+J7d5VlH1hvTSXvnOs37KzxRzGXxCp8
	KzjjcIbV/7j5ZqIdEka+KjYIJ+q9xrnKyOHhNAg8NPb3MlffjNTmqxmviTSOK/M+Ov1HU9mlbSVe3
	dRsJXMls/sj+b/bIH/fLyXdDrdwc3SUu2f+M80zToU2vgaL5B2NnhCzRcC36w4t337eIu5gBJCv+9
	Czu7fkFVqvsl9CoTuok91umv2AL/IKc3hj7OdO2MFMLwtiCQ6fBSSZz40FYgurAI1LpgSzXjORNxJ
	V2sU8raJlgoU/tyOlAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9I7C-00000003izX-2WMJ;
	Thu, 16 Oct 2025 07:09:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9I7B-00000003iyU-1rZF
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 07:09:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FAD263E00
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 07:09:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C7E1C19421
	for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 07:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760598572;
	bh=tqV9FavTAJh9wwxG6Et9o3AWwjkTpQ0pr7p3j83KK8k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Xe7JBxzeInVfqXCl30crkAoZKPlv0JxDULRpxKeiQx5o7l/IMchBaq/par5aRtcp3
	 gs/axer1A7kCXMl2dVcSnwWYn3g8Khc69FdttLNmUCWBWQbJIyuZ3nEpXO+XUQmM7P
	 MXhIZFuholGSfKnSaDKNnDhjYfMSuaPukvUwLuVv3Ht+eBnyRW9K5e84fsHnHyl9Jz
	 9LHb0qhZFtAWBxrE4Z5JsEAvfJUNreyFhgz+EELrIoT0GBkPqJ/02W3LT5FIVykC9k
	 BVk3gVv3uleoVfGdhyLGpjV4uvK2PdShwc8NK83LSgT+UnQUZCzcELYQahlvTtvtTa
	 BwaynlFdF9frA==
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so2359885e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 00:09:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWboTm4BbqQ5G7Oyy7anH4vuAMSgcQpq4vrXZGbAlQ8HI7Blv6HMkWggk9wOPcPP7in9fwLEIZ7QVkGyQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6MubuIEEDihkjjPnuWrW27YwxLWTILm+zOmA2ADdG4bY2SrU/
	cZRNFzydyJP3+q31lyz0YrAweaxDg45NY0BJVT1DBwjiRMxlJyOmq7yPXDOivSSsUaGNVzMNu6w
	BjDJAO8msQ2+qmcDwD0HdiLHDnqkYKGU=
X-Google-Smtp-Source: AGHT+IHHL1wmC6o8ypcfmXssG1HsqaRz5sLpx25KrCBoheuAiefWNbSeD8xiWWhZW3/XWyXX6/AoCKLYw9iXj/fvMCk=
X-Received: by 2002:a05:600c:5491:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-47114afc8b2mr2348225e9.3.1760598570695; Thu, 16 Oct 2025
 00:09:30 -0700 (PDT)
MIME-Version: 1.0
References: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 16 Oct 2025 15:09:18 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQLkddb-eGhkMSOBib9_fMt1Loo9aoR2tH-kVdekQdQzQ@mail.gmail.com>
X-Gm-Features: AS18NWChYWNrMcrxKh1WVuaWbDYhak1Eefs61R7VEYdLZUYyFemN78y3cS5ohSc
Message-ID: <CAJF2gTQLkddb-eGhkMSOBib9_fMt1Loo9aoR2tH-kVdekQdQzQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Read HGEIP CSR on the correct cpu
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgOToyN+KAr0FNIDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRmFuZ3l1IFl1IDxmYW5neXUueXVAbGludXguYWxpYmFi
YS5jb20+Cj4KPiBXaGVuIGV4ZWN1dGluZyBrdm1fcmlzY3ZfdmNwdV9haWFfaGFzX2ludGVycnVw
dHMsIHRoZSB2Q1BVIG1heSBoYXZlCj4gbWlncmF0ZWQgYW5kIHRoZSBJTVNJQyBWUy1maWxlIGhh
dmUgbm90IGJlZW4gdXBkYXRlZCB5ZXQsIGN1cnJlbnRseQo+IHRoZSBIR0VJUCBDU1Igc2hvdWxk
IGJlIHJlYWQgZnJvbSB0aGUgaW1zaWMtPnZzZmlsZV9jcHUgKCB0aGUgcENQVQo+IGJlZm9yZSBt
aWdyYXRpb24gKSB2aWEgb25fZWFjaF9jcHVfbWFzaywgYnV0IHRoaXMgd2lsbCB0cmlnZ2VyIGFu
Cj4gSVBJIGNhbGwgYW5kIHJlcGVhdGVkIElQSSB3aXRoaW4gYSBwZXJpb2Qgb2YgdGltZSBpcyBl
eHBlbnNpdmUgaW4KPiBhIG1hbnktY29yZSBzeXN0ZW1zLgo+Cj4gSnVzdCBsZXQgdGhlIHZDUFUg
ZXhlY3V0ZSBhbmQgdXBkYXRlIHRoZSBjb3JyZWN0IElNU0lDIFZTLWZpbGUgdmlhCj4ga3ZtX3Jp
c2N2X3ZjcHVfYWlhX2ltc2ljX3VwZGF0ZSBtYXkgYmUgYSBzaW1wbGUgc29sdXRpb24uCj4KPiBG
aXhlczogNGNlYzg5ZGI4MGJhICgiUklTQy1WOiBLVk06IE1vdmUgSEdFSVtFfFBdIENTUiBhY2Nl
c3MgdG8gSU1TSUMgdmlydHVhbGl6YXRpb24iKQo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8
ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFf
aW1zaWMuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMu
YyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gaW5kZXggZmRhMDM0NmYwZWExLi4xNjhj
MDJhZDBhNzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiArKysg
Yi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+IEBAIC02ODksOCArNjg5LDEyIEBAIGJvb2wg
a3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2hhc19pbnRlcnJ1cHQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQo+ICAgICAgICAgICovCj4KPiAgICAgICAgIHJlYWRfbG9ja19pcnFzYXZlKCZpbXNpYy0+
dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiAtICAgICAgIGlmIChpbXNpYy0+dnNmaWxlX2NwdSA+IC0x
KQo+IC0gICAgICAgICAgICAgICByZXQgPSAhIShjc3JfcmVhZChDU1JfSEdFSVApICYgQklUKGlt
c2ljLT52c2ZpbGVfaGdlaSkpOwo+ICsgICAgICAgaWYgKGltc2ljLT52c2ZpbGVfY3B1ID4gLTEp
IHsKPiArICAgICAgICAgICAgICAgaWYgKGltc2ljLT52c2ZpbGVfY3B1ICE9IHNtcF9wcm9jZXNz
b3JfaWQoKSkKV2h5IG5vdCBpZiAoaW1zaWMtPnZzZmlsZV9jcHUgIT0gdmNwdS0+Y3B1KT8KaWYg
cGNwdSBjaGFuZ2VkLCB0aGUga3ZtX3NjaGVkX2luKCkgd291bGQgdXBkYXRlICJ2Y3B1LT5jcHUg
YnkKcmF3X3NtcF9wcm9jZXNzb3JfaWQoKSIuCgpUaGUgc21wX3Byb2Nlc3Nvcl9pZCgpIG1heSBp
bnZvbHZlIERFQlVHX1BSRUVNUFQgY29kZSwgYW5kCmNoZWNrX3ByZWVtcHRpb25fZGlzYWJsZWQo
KSBtYXkgY2F1c2UgYSBwcm9ibGVtPyBBbnl3YXksIGEgZnVsbApzbXBfcHJvY2Vzc29yX2lkKCkg
aXMgbm90IG5lZWRlZCBoZXJlLCB2Y3B1LT5jcHUgaXMgZW5vdWdoLgoKSWYgKGltc2ljLT52c2Zp
bGVfY3B1ICE9IHZjcHUtPmNwdSksIHRoZW46CgpSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3VvcmVu
QGtlcm5lbC5vcmc+Cgo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHRydWU7CkFncmVl
IQoKV2hlbiBhIHZDUFUgbWlncmF0ZXMgdG8gYW5vdGhlciBwQ1BVLCB3ZSBjb3VsZCBhc3N1bWUg
dGhlIGludGVycnVwdApoYXMgY29tZSBpbiB0byBwcmV2ZW50IHRoZSBtaXNzaW5nIGludGVycnVw
dC4KClRvIGlsbHVzdHJhdGUgd2h5IHJldCA9IHRydWUsIGNvbnNpZGVyIHRoaXMgZXhhbXBsZToK
CjEuIEd1ZXN0IFdGSSBWTV9leGl0LgoKMi4gSG9zdCBUcmFwIC0+IGt2bV9yaXNjdl92Y3B1X2V4
aXQoKSAtPiBrdm1fcmlzY3ZfdmNwdV92aXJ0dWFsX2luc24oKQotPmt2bV92Y3B1X2hhbHQoKSAt
PgogICAga3ZtX3ZjcHVfY2hlY2tfYmxvY2soKSAtPiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNf
aGFzX2ludGVycnVwdCgpIGxvb3A6CiAgICAgICAgZm9yICg7OykgewogICAgICAgICAgICAgICAg
c2V0X2N1cnJlbnRfc3RhdGUoVEFTS19JTlRFUlJVUFRJQkxFKTsKCiAgICAgICAgICAgICAgICBp
ZiAoa3ZtX3ZjcHVfY2hlY2tfYmxvY2sodmNwdSkgPCAwKQogICAgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKCiAgICAgICAgICAgICAgICB3YWl0ZWQgPSB0cnVlOwogICAgICAgICAgICAgICAg
c2NoZWR1bGUoKTsgLy8gaWYgcGNwdSBjaGFuZ2VkLCB0aGUga3ZtX3NjaGVkX2luKCkKd291bGQg
dXBkYXRlICJ2Y3B1LT5jcHUgPSByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpIi4KICAgICAgICB9Cgog
My4gQmFjayB0byB0aGUgb3V0ZXIgbG9vcCBpbiBrdm0vdmNwdS5jOgogICAgICAgIHdoaWxlIChy
ZXQgPiAwKSB7CiAgICAgICAgICAgICAgICAvKiBDaGVjayBjb25kaXRpb25zIGJlZm9yZSBlbnRl
cmluZyB0aGUgZ3Vlc3QgKi8KICAgICAgICAgICAgICAgIHJldCA9IHhmZXJfdG9fZ3Vlc3RfbW9k
ZV9oYW5kbGVfd29yayh2Y3B1KTsKICAgICAgICAgICAgICAgIGlmIChyZXQpCiAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwogICAgICAgICAgICAgICAgcmV0ID0gMTsKCiAgICAgICAg
ICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX3ZtaWRfdXBkYXRlKHZjcHUpOwoKICAgICAgICAgICAg
ICAgIGt2bV9yaXNjdl9jaGVja192Y3B1X3JlcXVlc3RzKHZjcHUpOwoKICAgICAgICAgICAgICAg
IHByZWVtcHRfZGlzYWJsZSgpOwoKICAgICAgICAgICAgICAgIC8qIFVwZGF0ZSBBSUEgSFcgc3Rh
dGUgYmVmb3JlIGVudGVyaW5nIGd1ZXN0ICovCiAgICAgICAgICAgICAgICByZXQgPSBrdm1fcmlz
Y3ZfdmNwdV9haWFfdXBkYXRlKHZjcHUpOyAvLyBVcGRhdGUKaW1zaWMtPnZzZmlsZV9jcHUgd2l0
aCB2Y3B1LT5jcHU7Cgo0LiBWTV9lbnRlciBHdWVzdCBXRkkKICAgIElmIHRoZXJlIGFyZSBubyBj
aGFuZ2VzLCB0aGVuIEd1ZXN0IFdGSSBWTV9leGl0IGFnYWluLgoKNS4gSG9zdCBUcmFwIGFnYWlu
LCBidXQgdGhlIHZzZmlsZV9jcHUgJiB2Y3B1LT5jcHUgJgpyYXdfc21wX3Byb2Nlc3Nvcl9pZCgp
IGFyZSBzeW5jaHJvbml6ZWQuCgoKCj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSAhIShjc3JfcmVhZChDU1JfSEdFSVApICYgQklUKGltc2ljLT52
c2ZpbGVfaGdlaSkpOwo+ICsgICAgICAgfQo+ICAgICAgICAgcmVhZF91bmxvY2tfaXJxcmVzdG9y
ZSgmaW1zaWMtPnZzZmlsZV9sb2NrLCBmbGFncyk7Cj4KPiAgICAgICAgIHJldHVybiByZXQ7Cj4g
LS0KPiAyLjUwLjEKPgoKCi0tCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

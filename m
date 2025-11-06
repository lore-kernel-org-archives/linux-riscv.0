Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E34CCFA18
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44b5z/KXwSgFuftcNwdXLAoVbM+2AQXPk3gv2Dcwrxk=; b=YJP2BhyWJwQ8SQ
	itT1pqKRWR7h7SLhxBH+T0WKFAiKvjvUwIl918rxWBj8vxaedz4Wrr1utSnTdreMoIP3SW6ryX1ZF
	8cJREKHN686Bgd43PFA9zpiQ3Fo4NfxtbBdc8p2OjQulZlPpgxQ/7vVVyIBYpbUFbp+2v9boo9xp2
	DfGmxHrDnFTAWUF6plr7NVH+wOTu6KEMJN9Mb0FIIS1YN+0hTU+0MbUjNhM1/+K1MfumEKBif21MV
	RWIhqo+mtQWGK2HQGbpub26bvXAGbdMO/yb/7sH1kGCuMlhO4j9/Jd90S5yFA02juJjgY3G2iAKN4
	S31hpZsRGFqYdgCeZR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwpg-0000000FFdv-0gLE;
	Thu, 06 Nov 2025 10:03:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGwpF-0000000FEz3-0VZw
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 10:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762423360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVdSTjzPPKZ2l7IW0u0zSr5SxYY9yMb26AdkoDhOwNg=;
	b=MD8xsJWkduRzVGe2fxpuNfm4uOtDvRb1YhlT3o+NTGygUkrUQ0CPxVrvEOlJbCWFZ/YhGt
	+fjCIv61CLlmIhtrSOfzqYVAl9wqYYP/U7bPwP9MetRlZ0QOzh2Wo4HeQI8R2SGhsFx4sS
	OD3PeJTracPpkcAbcLCspSjgGtLPzCg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-eb5n55xNOkykcaPIlh3SIQ-1; Thu, 06 Nov 2025 05:02:38 -0500
X-MC-Unique: eb5n55xNOkykcaPIlh3SIQ-1
X-Mimecast-MFC-AGG-ID: eb5n55xNOkykcaPIlh3SIQ_1762423357
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-429c8d07874so421990f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 06 Nov 2025 02:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762423357; x=1763028157;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tvrt5C8X1gp1kp6b+KY8cbLTeVcvbbT6G6kNQJkblK8=;
        b=fXJdGP4W9tPDpSi8+evLqmMKgypNywxOssSgDCN2Y7OBki3PdOHzRU74WmpprkpsK5
         lOuDUsbW6guiSKQLTuotkT71/1rb1DIowtwZQn5hPX5No91oLq2ZWqmIJ6btMRJD6kjA
         tH74yw+aWNkyoNgwsOCEmBoADXWlS3Cpg1yAfYX8z/4kEFT9X5HC5jH+ergyLgCLMY7K
         fA+1b+xgnXew5JzQpcL8yXprld/c3NO0q0FM+PkbOLnlYGMDkXCQo9fb2ph4PPy2d0k5
         nHhbqKSudRcC1Om/cnT64ERpP+oAepiWUAuzyegxE71pyGIXhsBN4WYwBo+S9nnwVdbM
         Vmxw==
X-Forwarded-Encrypted: i=1; AJvYcCW9Tx0YVdEKYqZ5M/eYBlGYvzGwwgN0poUHIOzAcFa19dSCGRNS6sI4SsTpX1kKpIgnnA3rOtYIxcIzPg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4mIdoiN1vCyddG6SvULF7fkg94mUwjtNSUXSkjoQtOKVWcgJS
	xBchE6YRAINdlxILSkR9Aij5Dlkznan+XAjKDcYl0se3ZM/ESS+WYmcYjRCGBwQt06bF6P+VnXR
	1XtYBhymRejh0SaZ9rVJQDw0nL74g9dsL4O/1ZAZNP6OqQuX11npYQezlmtaFyrg+Czutiw==
X-Gm-Gg: ASbGnctS959w9jGn9UdnkMXtSg57rgTa3SjPbWLwwUk4o0QdBAY70BjBMg+RCSosvlf
	uhDxZDZqWpxxOKak0N90lm6LBUWa5mkdRyYftPsHziy8XpCXA2u/rU38rmV2oukwrun2u3ztc6w
	ec7qgrjAUNLnwKRQZVMzKGmQkPkrp7r7RH+HrKgApzYVl2EBap7Gzc9NOg8Kux1Qrg74AQER86/
	o3hnbhxMyIhNoFSsrJ70S6c7sXt8+NlVbih6StUKXHQbtQn+z7jdb+FOtxB8av8aFCLpB+SHNx4
	v5A8GwFXi5mOOkLkj/PDeVxkVWOz2hYiNcU5Yy3rKdExAaV64J9pgfyDhL2KdSYeOQEoVpzPY3u
	WS6kNCT7Iu1SBaXKFxAMHua94oQ+7XlfNaqwAdq795qr5ALDwQZ6xMSf+pbJ9
X-Received: by 2002:a05:6000:2007:b0:429:bd09:e7ce with SMTP id ffacd0b85a97d-429e32e3751mr5572188f8f.18.1762423357265;
        Thu, 06 Nov 2025 02:02:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFeAmOLmzeYzGPgujTP1e064ll50Q3Ih/Pj2s9y519WV4ZUw6Tz0GJFNvPvZOTYQG+myOLaw==
X-Received: by 2002:a05:6000:2007:b0:429:bd09:e7ce with SMTP id ffacd0b85a97d-429e32e3751mr5572131f8f.18.1762423356748;
        Thu, 06 Nov 2025 02:02:36 -0800 (PST)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (213-44-135-146.abo.bbox.fr. [213.44.135.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429eb477203sm4112751f8f.29.2025.11.06.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 02:02:36 -0800 (PST)
From: Valentin Schneider <vschneid@redhat.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave
 Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, "Paul E. McKenney" <paulmck@kernel.org>, Jason Baron
 <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel
 <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, "David S.
 Miller" <davem@davemloft.net>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mel Gorman <mgorman@suse.de>, Andrew
 Morton <akpm@linux-foundation.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, Rik van Riel
 <riel@surriel.com>, Jann Horn <jannh@google.com>, Dan Carpenter
 <dan.carpenter@linaro.org>, Oleg Nesterov <oleg@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Clark Williams <williams@redhat.com>, Yair
 Podemsky <ypodemsk@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
In-Reply-To: <aQuNdOEmPYkI03my@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
 <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQJLpSYz3jdazzdb@localhost.localdomain>
 <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQuNdOEmPYkI03my@localhost.localdomain>
Date: Thu, 06 Nov 2025 11:02:34 +0100
Message-ID: <xhsmh5xbn5vid.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZnyFErCK3cQd00fMz58NVdCw_D63ChaeEsusnfZgIKE_1762423357
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_020241_286630_0C12FB86 
X-CRM114-Status: GOOD (  27.58  )
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

T24gMDUvMTEvMjUgMTg6NDYsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4gTGUgV2VkLCBO
b3YgMDUsIDIwMjUgYXQgMDU6MjQ6MjlQTSArMDEwMCwgVmFsZW50aW4gU2NobmVpZGVyIGEgw6lj
cml0IDoKPj4gT24gMjkvMTAvMjUgMTg6MTUsIEZyZWRlcmljIFdlaXNiZWNrZXIgd3JvdGU6Cj4+
ID4gTGUgV2VkLCBPY3QgMjksIDIwMjUgYXQgMTE6MzI6NThBTSArMDEwMCwgVmFsZW50aW4gU2No
bmVpZGVyIGEgw6ljcml0IDoKPj4gPj4gSSBuZWVkIHRvIGhhdmUgYSB0aGluayBhYm91dCB0aGF0
IG9uZTsgb25lIHBhaW4gcG9pbnQgSSBzZWUgaXMgdGhlIGNvbnRleHQKPj4gPj4gdHJhY2tpbmcg
d29yayBoYXMgdG8gYmUgTk1JIHNhZmUgc2luY2UgZS5nLiBhbiBOTUkgY2FuIHRha2UgdXMgb3V0
IG9mCj4+ID4+IHVzZXJzcGFjZS4gQW5vdGhlciBpcyB0aGF0IE5PSFotZnVsbCBDUFVzIG5lZWQg
dG8gYmUgc3BlY2lhbCBjYXNlZCBpbiB0aGUKPj4gPj4gc3RvcCBtYWNoaW5lIHF1ZXVlaW5nIC8g
Y29tcGxldGlvbi4KPj4gPj4KPj4gPj4gL21lIGdvZXMgZmV0Y2ggYSBuZXcgbm90ZWJvb2sKPj4g
Pgo+PiA+IFNvbWV0aGluZyBsaWtlIHRoZSBiZWxvdyAodW50ZXN0ZWQpID8KPj4gPgo+Pgo+PiBT
b21lIG1pbm9yIG5pdHMgYmVsb3cgYnV0IG90aGVyd2lzZSB0aGF0IGxvb2tzIHByb21pc2luZy4K
Pj4KPj4gT25lIHByb2JsZW0gSSdtIGhhdmluZyBob3dldmVyIGlzIHJlYXNvbmluZyBhYm91dCB0
aGUgZGFuZ2VyIHpvbmU7IHdoYXQKPj4gZm9yYmlkZGVuIGFjdGlvbnMgY291bGQgYSBOT19IWl9G
VUxMIENQVSB0YWtlIHdoZW4gZW50ZXJpbmcgdGhlIGtlcm5lbAo+PiB3aGlsZSB0YWtlX2NwdV9k
b3duKCkgaXMgaGFwcGVuaW5nPwo+Pgo+PiBJJ20gYWN0dWFsbHkgbm90IGZhbWlsaWFyIHdpdGgg
d2h5IHdlIGFjdHVhbGx5IHVzZSBzdG9wX21hY2hpbmUoKSBmb3IgQ1BVCj4+IGhvdHBsdWc7IEkg
c2VlIHRoaW5ncyBsaWtlIENQVUhQX0FQX1NNUENGRF9EWUlORzo6c21wY2ZkX2R5aW5nX2NwdSgp
IG9yCj4+IENQVUhQX0FQX1RJQ0tfRFlJTkc6OnRpY2tfY3B1X2R5aW5nKCkgZXhwZWN0IG90aGVy
IENQVXMgdG8gYmUgcGF0aWVudGx5Cj4+IHNwaW5uaW5nIGluIG11bHRpX2NwdV9zdG9wKCksIGFu
ZCBJICp0aGluayogbm90aGluZyBpbiB0aGUgZW50cnkgY29kZSB1cCB0bwo+PiBjb250ZXh0X3Ry
YWNraW5nIGVudHJ5IHdvdWxkIGRpc3J1cHQgdGhhdCwgYnV0IGl0J3Mgbm90IGEgc21hbGwgdGhp
bmcgdG8KPj4gcmVhc29uIGFib3V0Lgo+Pgo+PiBBRkFJQ1Qgd2UgbmVlZCB0byByZWFzb24gYWJv
dXQgZXZlcnkgLnRlYXJkb3duIGNhbGxiYWNrIGZyb20KPj4gQ1BVSFBfVEVBUkRPV05fQ1BVIHRv
IENQVUhQX0FQX09GRkxJTkUgYW5kIHRoZWlyIGV4cGxpY2l0ICYgaW1wbGljaXQKPj4gZGVwZW5k
ZW5jaWVzIG9uIG90aGVyIENQVXMgYmVpbmcgU1RPUCdkLgo+Cj4gWW91J3JlIHJhaXNpbmcgYSB2
ZXJ5IGludGVyZXN0aW5nIHF1ZXN0aW9uLiBUaGUgaW5pdGlhbCBwb2ludCBvZiBzdG9wX21hY2hp
bmUoKQo+IGlzIHRvIHN5bmNocm9uaXplIHRoaXM6Cj4KPiAgICAgc2V0X2NwdV9vbmxpbmUoY3B1
LCAwKQo+ICAgICBtaWdyYXRlIHRpbWVyczsKPiAgICAgbWlncmF0ZSBocnRpbWVyczsKPiAgICAg
Zmx1c2ggSVBJczsKPiAgICAgZXRjLi4uCj4KPiBhZ2FpbnN0IHRoaXMgcGF0dGVybjoKPgo+ICAg
ICBwcmVlbXB0X2Rpc2FibGUoKQo+ICAgICBpZiAoY3B1X29ubGluZShjcHUpKQo+ICAgICAgICAg
cXVldWUgc29tZXRoaW5nOyAvLyBjb3VsZCBiZSB0aW1lciwgSVBJLCBldGMuLi4KPiAgICAgcHJl
ZW1wdF9lbmFibGUoKQo+Cj4gVGhlcmUgaGF2ZSBiZWVuIGF0dGVtcHRzOgo+Cj4gICAgICAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQxMjE4MTcxNTMxLjIyMTcyNzUtMS1jb3N0YS5z
aHVsQHJlZGhhdC5jb20vCj4KPiBBbmQgcmVhbGx5IGl0IHNob3VsZCBiZSBmaW5lIHRvIGp1c3Qg
ZG86Cj4KPiAgICAgc2V0X2NwdV9vbmxpbmUoY3B1LCAwKQo+ICAgICBzeW5jaHJvbml6ZV9yY3Uo
KQo+ICAgICBtaWdyYXRlIC8gZmx1c2ggc3R1ZmYKPgoKVGhhdCdzIHdoYXQgSSB3YXMgdGhpbmtp
bmcgYXMgd2VsbCwgYXQgdGhlIHZlcnkgbGVhc3QgZm9yIHRoZQpjcHVfb25saW5lX21hc2sgYml0
LgoKPiBQcm9iYWJseSB3ZSBzaG91bGQgdHJ5IHRoYXQgaW5zdGVhZCBvZiB0aGUgYnVzeSBsb29w
IEkgcHJvcG9zZWQKPiB3aGljaCBvbmx5IHBhcGVycyBvdmVyIHRoZSBwcm9ibGVtLgo+Cj4gT2Yg
Y291cnNlIHRoZXJlIGFyZSBvdGhlciBhc3N1bXB0aW9ucy4gRm9yIGV4YW1wbGUgdGhlIHRpY2sK
PiB0aW1la2VlcGVyIGlzIG1pZ3JhdGVkIGVhc2lseSBrbm93aW5nIHRoYXQgYWxsIG9ubGluZSBD
UFVzIGFyZQo+IG5vdCBpZGxlIChjZjogdGlja19jcHVfZHlpbmcoKSkuIFNvIEkgZXhwZWN0IGEg
ZmV3IHRyYXBzLCB3aXRoIFJDVQo+IGZvciBleGFtcGxlIGFuZCBpbmRlZWQgYWxsIHRoZXNlIGhv
dHBsdWcgY2FsbGJhY2tzIG11c3QgYmUgYXVkaXRlZAo+IG9uZSBieSBvbmUuCj4KPiBJJ20gbm90
IGVudGlyZWx5IHVuZmFtaWxpYXIgd2l0aCBtYW55IG9mIHRoZW0uIExldCBtZSBzZWUgd2hhdCBJ
IGNhbiBkby4uLgo+CgpIZXJlIGJlIGRyYWdvbnMgOi0pCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2AC606A323
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dO+rVNB/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YWdbag6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0wBtboFI67NqN2nojQ3TlbN2aDEMYd/rS29TDU4PFWo=; b=dO+rVNB/i4TQLa+0XVDtnmmwD6
	uYdO2QxrJXgFBgKJb9XllZJpCjJDokeBUaudLFhdQ99e6QS5CiCWBRzf6spE9hzbGutbCP1iAntPT
	fXSpEk5XvRljmr0YB3W+eZ2o/BA0M8SR0QtdCtTzxI1Erqdo+17nr25Rz4zZc3h7UHoviNTM5IhV+
	GngiuHAFcu3D+qasQFb7xr8UxWBKjHavmdlIrwF6De8RrV5FlGfiizCKV7saLCHg3CDud1WOEFYpF
	eY+95vd1RaCoIZvO3oA5Rj6Nff+58N+jH+u4ndEdH/dbhGLxTz8as/2WBMgfTXSzwXcb8OoRDyOa9
	aQf2e8EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHOx-00000000k7r-1wcn;
	Sat, 28 Nov 2026 12:19:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXHOw-00000000k7Z-1iui
	for linux-riscv@lists.infradead.org;
	Sat, 28 Nov 2026 12:19:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5516F611C1;
	Sat, 28 Nov 2026 12:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC35D1F00893;
	Sat, 28 Nov 2026 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795868373;
	bh=PaiZ5W930vk37DsHxt8WEVy+OCInpgFJDXz+FZkTAZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWdbag6Yk+H0gTkdgXUG2WMSTFQJPUfKbA2nrVw8gYhQBZ/WUt1VOtUyFO3mGo4Pl
	 cqWH9vGQHYpXI4d6GOUW3ev3aoZFAnlzO065+Sh2TdxCmawFYpzSj/qVLemeO+HofF
	 xWb8nPNZl542f6wk3viVRvGJp42M0h7WO5HF+lwKX7TymgivtqZNgcsTCYweaVgSD+
	 hQIcnPB95VoHTja1HBOF5zsLUOLY+Gle9TRX1pUOW+hGhfRyfyOmOYk898SDDRB/DY
	 NIMPwxsBaCdkPMsdIVqm8A3s0gcbGc3FbyuLDYo5RB8PKPDMs+IWD5d2dNmhIsdRWi
	 6HGo+dCxtD+YQ==
Date: Sat, 28 Nov 2026 04:19:31 -0800
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: matches th1520 in filenames for RISC-V
 THEAD SoC
Message-ID: <awrG09RyWMAhJ_KC@thelio>
References: <20261126-th1520-maintainers-n-clause-v1-1-c1315e68e5be@iscas.ac.cn>
 <awpKGGPVJawHTK5E@thelio>
 <75bc19099b4f2c7384891621a86206c31071ebf5.camel@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75bc19099b4f2c7384891621a86206c31071ebf5.camel@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMjgsIDIwMjYgYXQgMDI6NTQ6NTlQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNi0xMS0yN+S6lOeahCAxOToyNyAtMDgwMO+8jERyZXcgRnVzdGluaeWG
memBk++8mgo+ID4gT24gVGh1LCBOb3YgMjYsIDIwMjYgYXQgMDU6NTM6MzJQTSArMDgwMCwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPiA+ID4gQXMgbW9yZSBhbmQgbW9yZSBkZXZpY2UgYmluZGluZyAv
IGRyaXZlcnMgYXJlIGNvbWluZyBmb3IgVEgxNTIwLAo+ID4gPiBpbmRpdnVkYWwgZmlsZW5hbWVz
IG5vdyBibG9hdHMgdGhpcyBNQUlOVEFJTkVSUyBlbnRyeS4KPiA+ID4gCj4gPiA+IFVzZSBOOiB0
byBtYXRjaCB0aDE1MjAgaW4gZmlsZW5hbWVzIGluc3RlYWQgb2YgbGlzdGluZyB0aGVtLgo+ID4g
Cj4gPiBHb29kIGlkZWEsIG5vdGhpbmcgZHJvcHMgb3V0LCBhbmQgdGhlYWQsdGgxNTIwLWR3LWhk
bWkueWFtbCBpcyBub3cKPiA+IGNvdmVyZWQsIHRvby4KPiA+IAo+ID4gWy4uXQo+ID4gPiAtRjoJ
ZHJpdmVycy9jbGsvdGhlYWQvY2xrLXRoMTUyMC1hcC5jCj4gPiAKPiA+IGZvciBjbGsgSSB0aGlu
ayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gbGlzdCB0aGUgZGlyZWN0b3J5IGxpa2UgdGhlIGVudHJ5
IGFscmVhZHkgZG9lcyBmb3IgcG1kb21haW46Cj4gPiAKPiA+ICAgIEY6CWRyaXZlcnMvY2xrL3Ro
ZWFkLwo+IAo+IEkgYWdyZWUgd2l0aCB0aGlzLgo+IAo+IFRoYW5rcywKPiBJY2Vub3d5CgpPa2F5
LCBJIGhhdmUgYXBwbGllZCBpdCB0byB0aGVhZC1kdC1mb3ItbmV4dDoKICAgICAKICBbMS8xXSBN
QUlOVEFJTkVSUzogbWF0Y2hlcyB0aDE1MjAgaW4gZmlsZW5hbWVzIGZvciBSSVNDLVYgVEhFQUQg
U29DCiAgICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9mdXN0aW5pL2MvN2Q3NTBkNWUzMGQ2
CgpUaGFua3MsCkRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK

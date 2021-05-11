Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EE5C433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 12:27:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CBBA61622
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 12:27:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CBBA61622
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qiOwoKCYM9guvax1htWLT/5KoOMdXq3Ey853dCajFig=; b=eVmsSDXtW9aRBT0I0hkCfS7pn
	E8BIo69/SA64EEXUZYvAglrfxY98COYcChdfHV1nA7bKIb6Jw4y6SwIMDO1kRHHZ6tsmjeTg/SUe1
	0aBFfyBKpYXonOKxvmzfN+/UV65Fk5E8SVBfr/mjIHYgTVvqRYC0H2TCq8T9/byto22UDcO4WDPDu
	6EjZXghJlHyv7ESgZ0S785W1Ds9fwbq2yJXcwHPGlVpoj98lzg639wOQYQtzq68RKWDwSr8S2sPl+
	/JSWGUgyb5StimDbaK4jIsdLeL1RSPGlySasrtF3lV6925IdzrZitn650dZetTPy8Dy++Y96DRbB3
	FOqbh8ytw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRTo-00HNmG-BB; Tue, 11 May 2021 12:27:16 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOFZ-00Gdqo-4y; Tue, 11 May 2021 09:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=gRUetXzDL0+XUXUfD2Prrdy582573EW6uFDl/cj6AqY=; b=rz/WA4VBofBbl1bb1Viun+UlTb
 Do6y4AlA7muCCAH7bJGVfdz/GgwwIaPq2fUvnIhgS97jbTRUpTp59k6jHLpRRMBh38bfmT9hrn+W3
 0KgWe7GAdP6mKOp7C9GjjQvVknoj7g5LjphsSHdxj6fWNEct/mV8YNICpSnr4YnOzgF6vps4wxcwF
 I2S/KWWRWh6cWhKYKz3y8fSm3XjXfk+9j9/i648ATHLylFsrdeq8U7MBASLzvOIcihcBjVJx0WK3w
 iYSMuDWcjiGSs8koGr43nuf+ejPUSrqJTne6KGOQsY4zJJcQohKIAXDhC1aqOdOStuwPN0NCT2naB
 g4v/vLVw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOFR-009PmN-Pi; Tue, 11 May 2021 09:00:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E709E611F1;
 Tue, 11 May 2021 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620723613;
 bh=ETvFtPpZWz6DN3iWb3G2WAPhojmYo6ps7EuchaChQ+E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PLGy/1LSbmraLJz9I+ZFpgkDxkCfvpVNiHxpQ06jZIl8i8GhyxDYM7Gy1/DkHiCt5
 klo7h/HCiZCdE58jLyhFWvaAVP5oc9x+G/BoSRcOX7C3Tl/sTRBZmSPn8j1vcyPJNt
 mRJS0yxqm/yCxF+CPVj6SxA/ae6jVWIEkJrXhN8oiyzJkjvRZFRVAZch9kSHP1iP93
 oW7IG29Utyoqz+QwiX4h4Rg5Qegv470eEj7pH0f2MN9paDsUyx4y03dGzSMfb4uf2a
 FDLqKCDGwM78HAqr/sdfeYExPB7ah8JOeYwd9qD22mRbJt8d7NaYnvORLTCVIJ25K4
 6sDaroZmf8XGQ==
Date: Tue, 11 May 2021 11:00:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Edward Cree <ecree.xilinx@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>, David Woodhouse
 <dwmw2@infradead.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 alsa-devel@alsa-project.org, coresight@lists.linaro.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-wired-lan@lists.osuosl.org, keyrings@vger.kernel.org,
 kvm@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fpga@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sgx@vger.kernel.org, linux-usb@vger.kernel.org,
 mjpeg-users@lists.sourceforge.net, netdev@vger.kernel.org,
 rcu@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/53] Get rid of UTF-8 chars that can be mapped as ASCII
Message-ID: <20210511110002.2f187f01@coco.lan>
In-Reply-To: <ed65025c-1087-9672-7451-6d28e7ab8f92@gmail.com>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <2ae366fdff4bd5910a2270823e8da70521c859af.camel@infradead.org>
 <20210510135518.305cc03d@coco.lan>
 <df6b4567-030c-a480-c5a6-fe579830e8c0@gmail.com>
 <YJk8LMFViV7Z3Uu7@casper.infradead.org>
 <ed65025c-1087-9672-7451-6d28e7ab8f92@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_020013_935242_3E4AC7A0 
X-CRM114-Status: GOOD (  33.01  )
/bin/ln: failed to access
 'reaver_cache/texts/20210511_020013_935242_3E4AC7A0': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_020013_935242_3E4AC7A0 
X-CRM114-Status: GOOD (  29.65  )
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

RW0gTW9uLCAxMCBNYXkgMjAyMSAxNTozMzo0NyArMDEwMApFZHdhcmQgQ3JlZSA8ZWNyZWUueGls
aW54QGdtYWlsLmNvbT4gZXNjcmV2ZXU6Cgo+IE9uIDEwLzA1LzIwMjEgMTQ6NTksIE1hdHRoZXcg
V2lsY294IHdyb3RlOgo+ID4gTW9zdCBvZiB0aGVzZQo+ID4gVVRGLTggY2hhcmFjdGVycyBjb21l
IGZyb20gbGF0ZXggY29udmVyc2lvbnMgYW5kIHJlYWxseSBhcmVuJ3QKPiA+IG5lY2Vzc2FyeSAo
YW5kIGFyZSBiZWluZyB1c2VkIGluY29ycmVjdGx5KS4gIAo+IEkgZnVsbHkgYWdyZWUgd2l0aCBm
aXhpbmcgdGhvc2UuCj4gVGhlIGNvdmVyLWxldHRlciwgaG93ZXZlciwgZ2F2ZSB0aGUgaW1wcmVz
c2lvbiB0aGF0IHRoYXQgd2FzIG5vdCB0aGUKPiAgbWFpbiBwdXJwb3NlIG9mIHRoaXMgc2VyaWVz
OyBqdXN0LCBwZXJoYXBzLCBhIGhhcHB5IHNpZGUtZWZmZWN0LgoKU29ycnkgZm9yIHRoZSBtZXNz
LiBUaGUgbWFpbiByZWFzb24gd2h5IEkgd3JvdGUgdGhpcyBzZXJpZXMgaXMgYmVjYXVzZQp0aGVy
ZSBhcmUgbG90cyBvZiBVVEYtOCBsZWZ0LW92ZXIgY2hhcnMgZnJvbSB0aGUgUmVTVCBjb252ZXJz
aW9uLgpTZWU6CiAgLSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1kb2MvMjAyMTA1MDcx
MDA0MzUuMzA5NWY5MjRAY29jby5sYW4vCgpBIGxhcmdlIHNldCBvZiB0aGUgVVRGLTggbGV0Zi1v
dmVyIGNoYXJzIHdlcmUgZHVlIHRvIG15IGNvbnZlcnNpb24gd29yaywKc28gSSBmZWVsIHBlcnNv
bmFsbHkgcmVzcG9uc2libGUgdG8gZml4IHRob3NlIDstKQoKWWV0LCB0aGlzIHNlcmllcyBoYXMg
dHdvIHBvc2l0aXZlIHNpZGUgZWZmZWN0czoKCiAtIGl0IGhlbHBzIHBlb3BsZSBuZWVkaW5nIHRv
IHRvdWNoIHRoZSBkb2N1bWVudHMgdXNpbmcgbm9uLXV0ZjggbG9jYWxlc1sxXTsKIC0gaXQgbWFr
ZXMgZWFzaWVyIHRvIGdyZXAgZm9yIGEgdGV4dDsKClsxXSBUaGVyZSBhcmUgc3RpbGwgc29tZSB3
aWRlbHkgdXNlZCBkaXN0cm9zIG5vd2FkYXlzIChMVFMgb25lcz8pIHRoYXQKICAgIGRvbid0IHNl
dCBVVEYtOCBhcyBkZWZhdWx0LiBMYXN0IHRpbWUgSSBpbnN0YWxsZWQgYSBEZWJpYW4gbWFjaGlu
ZQogICAgSSBoYWQgdG8gZXhwbGljaXRseSBzZXQgVVRGLTggY2hhcnNldCBhZnRlciBpbnN0YWxs
IGFzIHRoZSBkZWZhdWx0CiAgICB3ZXJlIHVzaW5nIEFTQ0lJIGVuY29kaW5nIChjYW4ndCByZW1l
bWJlciBpZiBpdCB3YXMgRGViaWFuIDEwIG9yIGFuCiAgICBvbGRlciB2ZXJzaW9uKS4KClVuaW50
ZW50aW9uYWxseSwgSSBlbmRlZCBieSBnaXZpbmcgZW1waGFzaXMgdG8gdGhlIG5vbi11dGY4IGlu
c3RlYWQgb2YKZ2l2aW5nIGVtcGhhc2lzIHRvIHRoZSBjb252ZXJzaW9uIGxlZnQtb3ZlcnMuCgpG
WUksIHRoaXMgcGF0Y2ggc2VyaWVzIG9yaWdpbmF0ZWQgZnJvbSBhIGRpc2N1c3Npb24gYXQgbGlu
dXgtZG9jLApyZXBvcnRpbmcgdGhhdCBTcGhpbnggYnJlYWtzIHdoZW4gTEFORyBpcyBub3Qgc2V0
IHRvIHV0Zi04WzJdLiBUaGF0J3MKd2h5IEkgcHJvYmFibHkgZW5kZWQgZ2l2aW5nIHRoZSB3cm9u
ZyBlbXBoYXNpcyBhdCB0aGUgY292ZXIgbGV0dGVyLgoKWzJdIFNlZSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1kb2MvMjAyMTA1MDYxMDM5MTMuR0U2NTY0QGtpdHN1bmUuc3VzZS5jei8K
ICAgIGZvciB0aGUgb3JpZ2luYWwgcmVwb3J0LiBJIHN0cm9uZ2x5IHN1c3BlY3QgdGhhdCB0aGUg
Vk0gc2V0IGJ5IE1pY2hhbCAKICAgIHRvIGJ1aWxkIHRoZSBkb2NzIHdhcyB1c2luZyBhIGRpc3Ry
byB0aGF0IGRvZXNuJ3Qgc2V0IFVURi04IGFzIGRlZmF1bHQuCgogICAgUFMuOiAKICAgICAgSSBp
bnRlbmQgdG8gcHJlcGFyZSBhZnRlcndhcmRzIGEgc2VwYXJhdGUgZml4IHRvIGF2b2lkIFNwaGlu
eAogICAgICBsb2dnZXIgdG8gY3Jhc2ggZHVyaW5nIEtlcm5lbCBkb2MgYnVpbGRzIHdoZW4gdGhl
IGxvY2FsZSBjaGFyc2V0CiAgICAgIGlzIG5vdCBVVEYtOCwgYnV0IEknbSBub3QgdG9vIGZsdWVu
dCBpbiBweXRob24uIFNvLCBJIG5lZWQgc29tZQogICAgICB0aW1lIHRvIGNoZWNrIGlmIGFyZSB0
aGVyZSBhIHdheSB0byBqdXN0IGF2b2lkIHB5dGhvbiBsb2cgY3Jhc2hlcwogICAgICB3aXRob3V0
IHRvdWNoaW5nIFNwaGlueCBjb2RlIGFuZCB3aXRob3V0IG5lZWRpbmcgdG8gdHJpY2sgaXQgdG8g
CiAgICAgIHRoaW5rIHRoYXQgdGhlIG1hY2hpbmUncyBsb2NhbGUgaXMgVVRGLTguCgpTZWU6IHdo
aWxlIHRoZXJlIHdhcyBqdXN0IGEgc2luZ2xlIGRvY3VtZW50IG9yaWdpbmFsbHkgc3RvcmVkIGF0
IHRoZQpLZXJuZWwgdHJlZSBhcyBhIExhVGVYIGRvY3VtZW50IGR1cmluZyB0aGUgdGltZSB3ZSBk
aWQgdGhlIGNvbnZlcnNpb24KKGNkcm9tLXN0YW5kYXJkLnRleCksIHRoZXJlIGFyZSBzZXZlcmFs
IG90aGVyIGRvY3VtZW50cyBzdG9yZWQgYXMgCnRleHQgdGhhdCBzZWVtZWQgdG8gYmUgZ2VuZXJh
dGVkIGJ5IHNvbWUgdG9vbCBsaWtlIExhVGVYLCB3aG9zZSB0aGUKb3JpZ2luYWwgdmVyc2lvbiB3
ZXJlIG5vdCBwcmVzZXJ2ZWQuIAoKQWxzbywgdGhlcmUgd2VyZSBvdGhlciBkb2N1bWVudHMgdXNp
bmcgZGlmZmVyZW50IG1hcmtkb3duIGRpYWxlY3RzIAp0aGF0IHdlcmUgY29udmVydGVkIHZpYSBw
YW5kb2MgKGFuZC9vciBvdGhlciBzaW1pbGFyIHRvb2xzKS4gVGhhdCdzIApub3QgdG8gbWVudGlv
biB0aGUgb25lcyB0aGF0IHdlcmUgY29udmVydGVkIGZyb20gRG9jQm9vay4gU3VjaAp0b29scyB0
ZW5kIHRvIHVzZSBzb21lIGxvZ2ljIHRvIHVzZSAibmVhdCIgdmVyc2lvbnMgb2Ygc29tZSBBU0NJ
SQpjaGFyYWN0ZXJzLCBsaWtlIHdoYXQgdGhpcyB0b29sIGRvZXM6CgoJaHR0cHM6Ly9kYXJpbmdm
aXJlYmFsbC5uZXQvcHJvamVjdHMvc21hcnR5cGFudHMvCgooU3BoaW54IGl0c2VsZiBzZWVtZWQg
dG8gdXNlIHRoaXMgdG9vbCBvbiBpdHMgZWFybHkgdmVyc2lvbnMpCgpBbGwgdG9vbC1jb252ZXJ0
ZWQgZG9jdW1lbnRzIGNhbiBjYXJyeSBVVEYtOCBvbiB1bmV4cGVjdGVkIHBsYWNlcy4gU2VlLApv
biB0aGlzIHNlcmllcywgYSBsYXJnZSBhbW91bnQgb2YgcGF0Y2hlcyBkZWFsIHdpdGggVStBMCAo
Tk8tQlJFQUsgU1BBQ0UpCmNoYXJzLiBJIGNhbid0IHNlZSB3aHkgc29tZW9uZSB3cml0aW5nIGEg
cGxhaW4gdGV4dCBkb2N1bWVudCAob3IgYSBSZVNUCm9uZSkgd291bGQgdHlwZSBhIE5PLUJSRUFL
IFNQQUNFIGluc3RlYWQgb2YgYSBub3JtYWwgd2hpdGUgc3BhY2UuCgpUaGUgc2FtZSBhcHBsaWVz
LCB1cCB0byBzb21lIHNvcnQsIHRvIGN1cmx5IGNvbW1hczogdXN1YWxseSBwZW9wbGUganVzdCAK
d3JpdGUgQVNDSUkgImNvbW1hcyIgb24gdGhlaXIgZG9jdW1lbnRzLCBhbmQgdXNlIHNvbWUgdG9v
bCBsaWtlIExhVGVYCm9yIGEgdGV4dCBlZGl0b3IgbGlrZSBsaWJyZW9mZmljZSBpbiBvcmRlciB0
byBjb252ZXJ0IHRoZW0gaW50bwog4oCcdXRmLTggY3VybHkgY29tbWFz4oCdWzNdLgoKWzNdIFNw
aGlueCB3aWxsIGRvIHN1Y2ggdGhpbmdzIGF0IHRoZSBwcm9kdWNlZCBvdXRwdXQsIGRvaW5nIHNv
bWV0aGluZyAKICAgIHNpbWlsYXIgdG8gd2hhdCBzbWFydHlwYW50cyBkb2VzLCBub3dhZGF5cyB1
c2luZyB0aGlzOgoKCWh0dHBzOi8vZG9jdXRpbHMuc291cmNlZm9yZ2UuaW8vZG9jcy91c2VyL3Nt
YXJ0cXVvdGVzLmh0bWwKCiAgICBFLiBnLjoKICAgICAgLSBTdHJhaWdodCBxdW90ZXMgKCIgYW5k
ICcpIHR1cm5lZCBpbnRvICJjdXJseSIgcXVvdGUgY2hhcmFjdGVyczsKICAgICAgLSBkYXNoZXMg
KC0tIGFuZCAtLS0pIHR1cm5lZCBpbnRvIGVuLSBhbmQgZW0tZGFzaCBlbnRpdGllczsKICAgICAg
LSB0aHJlZSBjb25zZWN1dGl2ZSBkb3RzICguLi4gb3IgLiAuIC4pIHR1cm5lZCBpbnRvIGFuIGVs
bGlwc2lzIGNoYXIuCgo+ID4gWW91IHNlZW0gcXVpdGUga25vd2VkZ2VhYmxlIGFib3V0IHRoZSB2
YXJpb3VzIGRpZmZlcmVuY2VzLiAgUGVyaGFwcwo+ID4geW91J2QgYmUgd2lsbGluZyB0byB3cml0
ZSBhIGRvY3VtZW50IGZvciBEb2N1bWVudGF0aW9uL2RvYy1ndWlkZS8KPiA+IHRoYXQgcHJvdmlk
ZXMgZ3VpZGFuY2UgZm9yIHdoZW4gdG8gdXNlIHdoaWNoIGtpbmRzIG9mIGhvcml6b250YWwKPiA+
IGxpbmU/Cj4gSSBoYXZlIE9waW5pb25zIGFib3V0IHRoZSBwcm9wZXIgdXNhZ2Ugb2YgcHVuY3R1
YXRpb24sIGJ1dCBJIGFsc28ga25vdyAgCj4gIHRoYXQgb3RoZXIgcGVvcGxlIGhhdmUgZGlmZmVy
aW5nIG9waW5pb25zLiAgRm9yIGluc3RhbmNlLCBJIHBsYWNlCj4gIHNwYWNlcyBhcm91bmQgYW4g
ZW0gZGFzaCwgd2hpY2ggaXMgbm9uc3RhbmRhcmQgYWNjb3JkaW5nIHRvIG1vc3QKPiAgc3R5bGUg
Z3VpZGVzLiAgUmVhbGx5IHRoaXMgaXMgYW4gaW5kaXZpZHVhbCBlbm91Z2ggdGhpbmcgdGhhdCBJ
J20gbm90Cj4gIHN1cmUgd2UgY291bGQgaGF2ZSBhICJrZXJuZWwgc3R5bGUgZ3VpZGUiIHRoYXQg
d291bGQgYmUgbW9yZSB1c2VmdWwKPiAgdGhhbiBnZW5lcmFsLXB1cnBvc2UgZ3VpZGFuY2UgbGlr
ZSB0aGUgcGFnZSB5b3UgbGlua2VkLgoKPiBNb3Jlb3Zlciwgc3VjaCBhIGd1aWRlIGNvdWxkIG1h
a2Ugbm9uLW5hdGl2ZSBzcGVha2VycyBuZWVkbGVzc2x5IHNlbGYtCj4gIGNvbnNjaW91cyBhYm91
dCB0aGVpciB3cml0aW5nIGFuZCBkaXNjb3VyYWdlIHRoZW0gZnJvbSBjb250cmlidXRpbmcKPiAg
ZG9jdW1lbnRhdGlvbiBhdCBhbGwuCgpJIGRvbid0IHRoaW5rIHNvLiBJbiBhIG1hdHRlciBvZiBm
YWN0LCBhcyBhIG5vbi1uYXRpdmUgc3BlYWtlciwgSSBndWVzcwp0aGlzIGNhbiBhY3R1YWxseSBo
ZWxwIHBlb3BsZSB3aWxsaW5nIHRvIHdyaXRlIGRvY3VtZW50cy4KCj4gIEknbSBub3QgYWR2b2Nh
dGluZyBoZXJlIGZvciB0cnlpbmcgdG8gcHVzaAo+ICBrZXJuZWwgZGV2ZWxvcGVycyB0b3dhcmRz
IGFuIGVhdHMtc2hvb3RzLWFuZC1sZWF2ZXMgbGV2ZWwgb2YKPiAgbGluZ3Vpc3RpYyBwZWRhbnRy
eTsgcmF0aGVyLCBJIG1lcmVseSB0aGluayB0aGF0IGV4aXN0aW5nIGNvcnJlY3QKPiAgdXNhZ2Vz
IHNob3VsZCBiZSBsZWZ0IGludGFjdCAoYW5kIHRoZXJlZm9yZSwgZXhjaXNpbmcgaW5jb3JyZWN0
IHVzYWdlCj4gIHNob3VsZCBvbmx5IGJlIGF0dGVtcHRlZCBieSBzb21lb25lIHdpdGggYm90aCB0
aGUgZXhwZXJ0aXNlIGFuZCB0aW1lCj4gIHRvIGNoZWNrIGVhY2ggY2FzZSkuCj4gCj4gQnV0IGlm
IHlvdSByZWFsbHkgd2FudCBzdWNoIGEgZG9jIEkgd291bGRuJ3QgbWluZCBjb250cmlidXRpbmcg
dG8gaXQuCgpJTU8sIGEgZG9jdW1lbnQgbGlrZSB0aGF0IGNhbiBiZSBoZWxwZnVsLiBJIGNhbiBo
ZWxwIHJldmlld2luZyBpdC4KClRoYW5rcywKTWF1cm8KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK

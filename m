Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70C7C61DBD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 19:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:
	Subject:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pC39yEs1v6BEHJnLZ5C7g04VPEEaukoaAb7nKhDQlCE=; b=kwDnV73xkMOnH4
	ecOVKoS04zO+rC5BFaNP+AhnVC+qWIGP6XBY6TQpOP09TFNAcgGkaBzdhAPwkG5KEa+m85tNQKfe9
	JZzLL/mSlRDpBebbVVHAOC/BgbOaVnc/+UdjKJSl2Zd9Lm5HGpuUuJLpZAPGGanFz0Fqh+swr7oqv
	7XDLfDbCfUEtPxQFX2392qFvDkzADA3TeiwrUmwFeuwOyiOoTiY+IGFa8/SemJ+cc8FeVfUzdqJ1V
	ZvzMspXyfaPndGnx2K9T3xfWKiXw9eCzLCLDHg7+MVaKRhzNHE6MvehzZ+b97eJGuilv11jEiMyf/
	qwuM0tMuIOqQB5ZRxFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywXi-00000001MYg-1YW6;
	Tue, 25 Aug 2026 19:10:42 +0000
Received: from fanzine2.igalia.com ([213.97.179.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wywXf-00000001MY5-0z5W
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 19:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=elAJm2a/yvCuwNZQN8cT8iWBlOljI1OpyGvFLYC11uo=; b=RHvx1Ado+WH9EzbHIOX+ZddNR4
	p497xG/usjgdtyDE/kA/xbjOpyLIBJuOI92EZRwc1yOZOItUmNe5+oSRd4oxCZHOSJIg77xqmE+Tc
	K5PFV0rWFpwnhQ6m9KAj6Aq1yxVDoopN2BKsaUVqLC48h9H3wG5IGBXSnMlrjvxadR17ZpA62zFv6
	qnk+hsPSnk1nJmmcLcs7OjTT5cXXOefE42zyl0b94RK82DSvgwElUXWEAW9MTO2l5NBp9Zejkwn6T
	YNgx8l8tDqfY2WGCtiFY0jVvYc0jEiv34rN7tch6qSf2TkOPn3XRxDKM1uTJZIDi4f2h9zACbsB7B
	9kW+H63w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wywXL-009BHb-A7; Tue, 25 Aug 2026 21:10:19 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1wywXJ-00530G-Og; Tue, 25 Aug 2026 21:10:19 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1wywXJ-00000003he5-2ugE;
	Tue, 25 Aug 2026 21:10:17 +0200
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 16:10:17 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, kernel-dev@igalia.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 fsverity@lists.linux.dev, keyrings@vger.kernel.org, bpf@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 netdev@vger.kernel.org, linux-wpan@vger.kernel.org,
 lvs-devel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, linux-sctp@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-s390@vger.kernel.org,
 bridge@lists.linux.dev, mptcp@lists.linux.dev, rds-devel@oss.oracle.com,
 virtualization@lists.linux.dev
Subject: Re: [PATCH RFC v3 03/13] sysctl, mod_devicetable: add macro
 MODULE_SYSCTL_TABLE
In-Reply-To: <ao1P_mEJdyRExG3v@monoceros>
References: <20260819-sysctl-module-aliases-v3-0-aab90569365d@igalia.com>
 <20260819-sysctl-module-aliases-v3-3-aab90569365d@igalia.com>
 <aomlfGJM61qZKxx2@monoceros> <4e3eaf1d3419e808be046035f114bf6c@igalia.com>
 <aotteDcc588iwC6g@monoceros> <4aa22e41e8ff4bab6638cf0baaa9d07b@igalia.com>
 <ao1P_mEJdyRExG3v@monoceros>
Message-ID: <4a7925a800f0c9b36078a70bf35e960d@igalia.com>
X-Sender: mfo@igalia.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_121039_574162_B1BF9CD3 
X-CRM114-Status: GOOD (  24.76  )
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

T24gMjAyNi0wOC0yNSAwNToyNCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gSGVsbG8sCj4g
Cj4gT24gTW9uLCBBdWcgMjQsIDIwMjYgYXQgMDY6MDQ6MDNQTSAtMDMwMCwgTWF1cmljaW8gRmFy
aWEgZGUgT2xpdmVpcmEgd3JvdGU6Cj4+IE9uIDIwMjYtMDgtMjMgMTk6MTIsIFV3ZSBLbGVpbmUt
S8O2bmlnIHdyb3RlOgo+PiA+IE9uIFNhdCwgQXVnIDIyLCAyMDI2IGF0IDAxOjU3OjI0UE0gLTAz
MDAsIE1hdXJpY2lvIEZhcmlhIGRlIE9saXZlaXJhIHdyb3RlOgo+PiA+PiBPbiAyMDI2LTA4LTIy
IDEwOjQxLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPj4gPj4gPiBPbiBXZWQsIEF1ZyAxOSwg
MjAyNiBhdCAwMzoxNjoxNlBNIC0wMzAwLCBNYXVyaWNpbyBGYXJpYSBkZSBPbGl2ZWlyYSB3cm90
ZToKPj4gPj4gPj4gVGhlIE1PRFVMRV9TWVNDVExfVEFCTEUgbWFjcm8gZW1pdHMgYSBzdHJ1Y3Qg
bW9kdWxlX3N5c2N0bF90YWJsZSB2YXJpYWJsZQo+PiA+PiA+PiB3aXRoIHBvaW50ZXJzIHRvIGEg
c3lzY3RsIHRhYmxlJ3MgcGF0aCBhbmQgZW50cmllcywgYW5kIHRhYmxlL2VudHJ5IHNpemVzLgo+
PiA+PiA+Cj4+ID4+ID4gVGhhdCBuZXcgc3RydWN0IGRvZXNuJ3Qgc2VlbSB0byBjb250YWluIGFu
eSBwb2ludGVyPwo+PiA+Pgo+PiA+PiBUaGUgc3RydWN0IG1vZHVsZV9zeXNjdGxfdGFibGUgZmll
bGRzIC5wYXRoIGFuZCAudGFibGUgYXJlIHBvaW50ZXJzLAo+PiA+PiBhbHRob3VnaCB3aXRoIGtl
cm5lbF91bG9uZ190IHR5cGUgc28gdGhhdCB0aGUgc2FtZSAzMi82NC1iaXQgc2l6ZSBpcwo+PiA+
PiB1c2VkIGluIGZpbGUyYWxpYXMuYyBiYXNlZCBvbiBLRVJORUxfRUxGQ0xBU1MgKGFuZCBub3Qg
b24gdGhlIGhvc3QsCj4+ID4+IHdoaWNoIG1pZ2h0IGRpZmZlciB3aXRoIENST1NTX0NPTVBJTEUp
Lgo+PiA+Cj4+ID4gQ3Jvc3MgY29tcGlsYXRpb24gaXNuJ3QgYW4gaXNzdWUgZm9yIHRoZSBhbHJl
YWR5IGV4aXN0aW5nIGRldmljZSBpZAo+PiA+IHN0cnVjdHVyZXM7IG1hbnkgb2YgdGhlbSBhbHNv
IGNvbnRhaW4gcG9pbnRlcnMuCj4+ID4gKFdoaWxlIG1vZHBvc3QgZG9lc24ndCB1c2UgdGhlIHBv
aW50ZXJzLCB0aGUgc2l6ZSBvZiB0aGUgc3RydWN0dXJlcyBtdXN0Cj4+ID4gYmUga25vd24gdG8g
Y29ycmVjdGx5IGludGVycHJldCB0aGUgYXJyYXlzLikKPj4gCj4+IEluZGVlZC4gSSBtaXNzZWQg
c29tZSBkZXZpY2VfaWQgc3RydWN0dXJlcyB3aXRoIHBvaW50ZXJzLCBhbmQgdGhhdAo+PiBkZXZp
Y2V0YWJsZS1vZmZzZXRzLmMgaXMgY3Jvc3MtY29tcGlsZWQgdG8gZ2VuZXJhdGUKPj4gZGV2aWNl
dGFibGUtb2Zmc2V0cy5oIGZvciBmaWxlMmFsaWFzLmMgdG8gdXNlIG9mZnNldHMgYW5kIHNpemVz
IG9mIHRoZQo+PiB0YXJnZXQgYXJjaGl0ZWN0dXJlLgo+PiAKPj4gSSdsbCBjaGFuZ2UgLnBhdGgg
YW5kIC50YWJsZSB0byBwb2ludGVycyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+IAo+IEkgKnRoaW5r
KiB0aGUgZXhpc3RpbmcgZGV2aWNlLWlkIHN0cnVjdHMgdXNlIGNoYXJbXSBmb3Igc3RyaW5ncyB0
aGF0IGFyZQo+IHJlbGV2YW50IGZvciBtb2Rwb3N0LiBJIGxvb2sgZm9yd2FyZCB0byB5b3UgZmlu
ZGluZyBvdXQgaWYgdGhlcmUgaXMKPiBzdGlsbCBhIGp1c3RpZmljYXRpb24gZm9yIHRoYXQgOi1E
CgpBRkFJQ1QsIGFuIGFycmF5IGlzIHNpbXBsZXIgdG8gcmVhZCBpbiBmaWxlMmFsaWFzIGFzIGl0
IGlzIHN0b3JlZApkaXJlY3RseSBpbiB0aGUgc3ltYm9sOgoKRm9yIGV4YW1wbGU6CgpAIGluY2x1
ZGUvbGludXgvZGV2aWNlLWlkL29mLmggCgoJc3RydWN0IG9mX2RldmljZV9pZCB7CgkuLi4KCQlj
aGFyIGNvbXBhdGlibGVbMTI4XTsKCS4uLgoKQCBkcml2ZXJzL25ldC9ldGhlcm5ldC9rb3JpbmEu
YwoKCXN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGtvcmluYV9tYXRjaFtdID0gewoJ
CXsKCQkgICAgICAgIC5jb21wYXRpYmxlID0gImlkdCwzMjQzeC1lbWFjIiwKCS4uLgoJTU9EVUxF
X0RFVklDRV9UQUJMRShvZiwga29yaW5hX21hdGNoKTsKCndoaWNoIGJ1aWxkcwoKCSQgb2JqZHVt
cCAtdCBkcml2ZXJzL25ldC9ldGhlcm5ldC9rb3JpbmEubyB8IGdyZXAgX19tb2RfZGV2aWNlX3Rh
YmxlCgkwMDAwMDAwMDAwMDAxMDIwIGwgICAgIE8gLnJvZGF0YQkwMDAwMDAwMDAwMDAwMTkwCl9f
bW9kX2RldmljZV90YWJsZV9fa21vZF9rb3JpbmFfX29mX19rb3JpbmFfbWF0Y2gKCgkkIG9iamR1
bXAgLXMgLWogLnJvZGF0YSAtLXN0YXJ0LWFkZHJlc3M9MHgxMDIwCi0tc3RvcC1hZGRyZXNzPSQo
KDB4MTAyMCsweDE5MCkpIGRyaXZlcnMvbmV0L2V0aGVybmV0L2tvcmluYS5vCgkuLi4KCSAxMDIw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uLi4uLi4uLi4uLi4uCgkg
MTAzMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMCAgLi4uLi4uLi4uLi4uLi4u
LgoJIDEwNDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgIC4uLi4uLi4uLi4u
Li4uLi4KCSAxMDUwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwICAuLi4uLi4u
Li4uLi4uLi4uCgkgMTA2MCA2OTY0NzQyYyAzMzMyMzQzMyA3ODJkNjU2ZCA2MTYzMDAwMCAgaWR0
LDMyNDN4LWVtYWMuLgoJIDEwNzAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAg
IC4uLi4uLi4uLi4uLi4uLi4KCS4uLgoKQCBzY3JpcHRzL21vZC9maWxlMmxpYXMuYwoKCSNkZWZp
bmUgREVGX0ZJRUxEX0FERFIobSwgZGV2aWQsIGYpIFwKCQl0eXBlb2YoKChzdHJ1Y3QgZGV2aWQg
KikwKS0+ZikgKmYgPSAoKG0pICsgT0ZGXyMjZGV2aWQjI18jI2YpCgoJc3RhdGljIHZvaWQgZG9f
b2ZfZW50cnkoc3RydWN0IG1vZHVsZSAqbW9kLCB2b2lkICpzeW12YWwpCgl7CgkuLi4KCQlERUZf
RklFTERfQUREUihzeW12YWwsIG9mX2RldmljZV9pZCwgY29tcGF0aWJsZSk7CgkuLi4KCQp2b2lk
IGhhbmRsZV9tb2RkZXZ0YWJsZShzdHJ1Y3QgbW9kdWxlICptb2QsIHN0cnVjdCBlbGZfaW5mbyAq
aW5mbywKICAgICAgICAgICAgICAgICAgICAgICAgRWxmX1N5bSAqc3ltLCBjb25zdCBjaGFyICpz
eW1uYW1lKQp7CiAgICAgICAgdm9pZCAqc3ltdmFsOwouLi4KICAgICAgICAgICAgICAgIHN5bXZh
bCA9IHN5bV9nZXRfZGF0YShpbmZvLCBzeW0pOwoKT24gdGhlIG90aGVyIGhhbmQsIGEgcG9pbnRl
ciBpcyBzdG9yZWQgaW5kaXJlY3RseSB0aHJvdWdoIGEgcmVsb2NhdGlvbgppbiB0aGUgc3ltYm9s
LCB3aGljaCBpcyBub3QgYXMgc2ltcGxlIHRvIHJlYWQgKGkuZS4sIDEuIGZpbmQgdGhlCnJlbG9j
YXRpb24gc2VjdGlvbiBmb3IgdGhlIHN5bWJvbCdzIHNlY3Rpb247IDIuIGZpbmQgdGhlIHJlbG9j
YXRpb24gaW4KdGhhdCBzZWN0aW9uIGJ5IG1hdGNoaW5nIHJlbG9jYXRpb24gb2Zmc2V0cyB3aXRo
IGFuIG9mZnNldCBpbiB0aGUgc3ltYm9sCisgc3ltYm9sIGFkZHJlc3M7IDMuIGZpbmFsbHkgcmVh
ZCB0aGUgcmVsb2NhdGlvbidzIHRhcmdldCkuCgo+PiA+IEkgd291bGQgYmUgZ3JlYXQgaWYgeW91
ciBzZXJpZXMgZGlkbid0IGludHJvZHVjZSBhIG5ldyBvYnN0YWNsZSBmb3IKPj4gPiBbQ0hFUkld
Lgo+PiAKPj4gQWJzb2x1dGVseS4gSSdsbCBiZSBoYXBweSB0byBhZGp1c3QgdGhlIHNlcmllcyBh
bmQgdGVzdGluZyBmb3IgdGhhdC4KPj4gCj4+IENvdWxkIHlvdSBwbGVhc2UgY29uZmlybSBvbmUg
c2hvdWxkIGp1c3QgZm9sbG93IFsxXSwgd2hpY2ggdXNlcyBbMl0gdG8KPj4gYnVpbGQgdGhlIExM
Vk0gdG9vbGNoYWluLCBhbmQgdXNlIGl0IHRvIGJ1aWxkIHRoZSBrZXJuZWwgWzNdPwo+PiAKPj4g
WzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9jaGVyaS1saW51eCNidWlsZGluZy1hbmQtcnVubmluZwo+
PiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL2NoZXJpLWxpbnV4L2J1aWxkcm9vdAo+PiBbM10gaHR0
cHM6Ly9naXRodWIuY29tL0NIRVJJLUFsbGlhbmNlL2xpbnV4L3RyZWUvY29kYXNpcC1jaGVyaS1y
aXNjdi03LjEKPiAKPiBJIHVzZWQKPiBodHRwczovL2dpdGh1Yi5jb20vQ0hFUkktQWxsaWFuY2Uv
bWV0YS1jaGVyaS90cmVlL2NvZGFzaXAtc2NhcnRoZ2FwIGFuZAo+IGRpZG4ndCBjYXJlIGFib3V0
IHRvb2xjaGFpbiBhbmQgcm9vdGZzLiBJdCBhbHNvIGhhcyBxZW11IGludGVncmF0ZWQsIHNvCj4g
eW91IGNhbiBhY3R1YWxseSB0ZXN0IGl0LgoKSSdsbCB0YWtlIGEgbG9vazsgdGhhbmtzIQoKY2hl
ZXJzLAoKPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKCi0tIApNYXVyaWNpbwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

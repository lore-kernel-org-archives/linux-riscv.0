Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B6BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:45:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F39C20854
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 17:45:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k572EkDY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q+DLC54T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F39C20854
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h7qcGcckbsGrus3LSYWLDr5Pg9PhQh0QOBDkk+3vgMo=; b=k572EkDYbGyVw4bJ3xzDj1O8h
	MAHQPaECQikyqw2QgIqewBPG9+Tw+3sySwboJbCr2oowo1FA+4zksBqbUka5MIU/4eGf+B4A1GgTC
	o07diF3ka9R977Cv4gBDK/kkGU+OqeWdi8L3zlgWnXsLfdPz5u/qJo3xBmwdRkg48iovC3iN9BR+f
	7PabpMWaVvezT7svtMgjesrXFsAbS/t/zZMlDCNtwuVTTC6rmG2T2hctIAvbypwOh/VmN/T4rOKX3
	O6E5aKJ4cBZi7Zc5mIV/jAHfC6Z/xt7FfXZvGZumvzqJ+pqeKxH1pA6yL6j2ERgcmXPgpHggcjKjk
	vKL8DKCWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLXJs-0006r3-Av; Sat, 10 Nov 2018 17:45:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXJq-0006qu-Ta
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 17:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g7bywjeejAU4X8SeITUXR6E1YPSgqDIfeub3w3I3+Ic=; b=Q+DLC54TpwJ52yznrrIYoFThr+
 RMFGIqzRQg7SlhNGVzelwxyRiJ8dYVlS4ovqZTeJ0b6y72ewu3euZNRNHybEKJnTN3KqPbmD4wqch
 64l0QfxXZ5z1aSjI8H6RQXZjM2GgJT5Pl649Jj4Sj49yN5gCkISPDiuupThMFmZymo4sTw45hyC4s
 GOFCXjqtIzBeYF8DG90eviei7nAcmXZLzKnG0RrOPlYnfOuDiFIzLbD9TWfXYyRs+X+neqHxUXgk9
 FJRQL8xlRItZwNqljs6J5HXn9teS1TXLSI3WG/Kzbj73bHwQV4LTO3SeOEwjDTHWc+0UB7SmD6IVa
 uHUh0NtA==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLXJn-0001LA-Dk
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 17:45:13 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wAAHhSd9053103; Sat, 10 Nov 2018 19:43:30 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-73-5be718bfe939
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 95.CD.03682.FB817EB5; Sat, 10 Nov 2018 19:43:27 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wAAHhQpE003039; Sat, 10 Nov 2018 19:43:27 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 10 Nov 2018 19:43:26 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Subject: Re: [sw-dev] SBI extension proposal v2
Organization: FORTH
In-Reply-To: <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
Message-ID: <70910d55a0046d9ddc7d4308cb56e581@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRmVeSWpSXmKPExsXSHc2orLtf4nm0Qf9ONYuHPXeYLE5c+cdo
 sW3JalaLnbtfsFpsuR1j0fLhHavFohXfWSxa278xWZyesIjJYtvnFjaL028WMFksvX6RyaL5
 3Tl2i51dd1gtNk9YwGrRNovfYvuLfjaL5yt72RyEPPacnsXssWbeGkaPqb/PsHjsnHWX3WPm
 q4dMHrt2NbJ7PNx0iclj8wotj81L6j3eX//N5nGp+Tq7x+bT1R7tB7qZAnijuGxSUnMyy1KL
 9O0SuDKe9hYUbFSrOP99MWsD4ya5LkZODgkBE4n+22/Zuhi5OIQEDjNKnJj6kREkISRwiFGi
 7SMnRJGpxOy9nWBxXgFBiZMzn7CA2MwCFhJTr+xnhLDlJZq3zmYGsVkEVCX+7Z7LCmKzCWhK
 zL90EKieg0NEwECi+3kgRPkcFomVn1xBbGEBfYkpnw+BlfMLCEt8unsRzOYUCJRY9HUeC8Rt
 zUwS91esYoe4wUWic/MKJojbVCQ+/H4AFhcVUJZ4cWI66wRGoVlITp2F5NRZSE5dwMi8ilEg
 scxYLzO5WC8tv6gkQy+9aBMjOH7n+u5gPLfA/hCjAAejEg/vj+VPo4VYE8uKK3OB4cLBrCTC
 K7sFKMSbklhZlVqUH19UmpNafIhRmoNFSZz38IvwICGB9MSS1OzU1ILUIpgsEwenVANjH2ud
 YulN28dak0KXisadqzO8X/8kPHoeh/7Gs5Lzz4tPWJ6zyMmaq36GhpzKBfHwHoFDcqvenOsR
 c2RY4NqVsU731PRFj/708mVsM+f7bbj2/q0fdy+JNpptKjS+6PTebdOyeXu3vuZx7Sku3DBT
 fqtbTfGjWrPswpAX057fO7pqrkdcao2HEktxRqKhFnNRcSIAQMNG19sCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_174511_667354_75D01887 
X-CRM114-Status: GOOD (  34.37  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, atish.patra@wdc.com, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, mick@ics.forth.gr, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, Andrew Waterman <andrew@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110174326.0hzV82TIKa9Z1Bg4cxahGe7AMV8_YS2B1tV_QmAAoCg@z>

zqPPhM65z4IgMjAxOC0xMS0xMCAxNzo0OCwgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDO
rc6zz4HOsc+IzrU6Cj4gLS0tCj4gY3Jvd2QtZnVuZGVkIGVjby1jb25zY2lvdXMgaGFyZHdhcmU6
IGh0dHBzOi8vd3d3LmNyb3dkc3VwcGx5LmNvbS9lb21hNjgKPiAKPiBPbiBTYXQsIE5vdiAxMCwg
MjAxOCBhdCAzOjMxIFBNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IAo+IHdy
b3RlOgo+PiAKPj4gzqPPhM65z4IgMjAxOC0xMS0xMCAwNzoxMiwgTHVrZSBLZW5uZXRoIENhc3Nv
biBMZWlnaHRvbiDOrc6zz4HOsc+IzrU6Cj4+ID4gT24gU2F0LCBOb3YgMTAsIDIwMTggYXQgMjo0
MiBBTSBBdGlzaCBQYXRyYSA8YXRpc2gucGF0cmFAd2RjLmNvbT4KPj4gPiB3cm90ZToKPj4gPgo+
PiA+PiAjIyBDb25jbHVzaW9uCj4+ID4+IFRoaXMgcHJvcG9zYWwgaXMgZmFyIGZyb20gcGVyZmVj
dCBhbmQgYWJzb2x1dGVseSBhbnkgc3VnZ2VzdGlvbiBpcwo+PiA+PiB3ZWxjb21lLiBPYnZpb3Vz
bHksIHRoZXJlIGFyZSBtYW55IG90aGVyIGZ1bmN0aW9uYWxpdGllcyB0aGF0IGNhbiBiZQo+PiA+
PiBhZGRlZCB0byB0aGlzIHByb3Bvc2FsLiBIb3dldmVyLCBJIGp1c3Qgd2FudGVkIHRvIHN0YXJ0
IHdpdGggc29tZXRoaW5nCj4+ID4+IHRoYXQgaXMgYW4gaW5jcmVtZW50YWwgY2hhbmdlIGF0IGJl
c3QgdG8ga2ljayBvZmYgdGhlIGRpc2N1c3Npb24uIFRoZQo+PiA+PiBhaW0gaGVyZSBpcyB0byBp
bml0aWF0ZSBhIGRpc2N1c3Npb24gdGhhdCBjYW4gbGVhZCB0byBhIHJvYnVzdCBTQkkKPj4gPj4g
c3BlY2lmaWNhdGlvbi4KPj4gPgo+PiA+ICB2ZXJ5IGNvb2wsIGF0aXNoLgo+PiA+Cj4+ID4gIGkg
d291bGQgdmVyeSBtdWNoIGxpa2UgdG8gc2VlIHRoZSBvcHRpb25hbCBhZGRpdGlvbiBvZiBtdWx0
aXBsZQo+PiA+IHNlcmlhbCBsaW5lcywgYnkgYWRkaW5nIGEgZ2V0Y2hhciBhbmQgcHV0Y2hhciBm
dW5jdGlvbiB0aGF0IHRha2VzIGp1c3QKPj4gPiBvbmUgZXh0cmEgYXJndW1lbnQ6IHRoZSBzZXJp
YWwgbGluZSBpbmRleC4KPj4gPgo+PiA+ICB0aGVyZSBhcmUgYSBsb3Qgb2YgZGlmZmVyZW50IHVz
ZXMgdG8gd2hpY2ggbXVsdC1zZXJpYWwgbGluZXMgbWF5IGJlCj4+ID4gcHV0Ogo+PiA+Cj4+ID4g
ICogYm9vdCBtZXNzYWdlIHNlcGFyYXRpb24gZnJvbSBjb25zb2xlIGxvZ2luCj4+ID4gICogYm9v
dCBtYW5hZ2VtZW50IHNlcGFyYXRpb24gZnJvbSBvdGhlciBwdXJwb3NlcyAodS1ib290L2NvcmVi
b290KQo+PiA+ICAqIHZpcnR1YWwgL2Rldi90dHlTMC0zCj4+ID4gICogY2xlYW4gVVBTIHJlcG9y
dGluZyBhbmQgbWFuYWdlbWVudAo+PiA+ICAqIHJlbW90ZSB2aXJ0dWFsIG1hY2hpbmUgcG93ZXIg
bWFuYWdlbWVudCAocG93ZXItb24gLyBvZmYpCj4+ID4gICogc2ltcGxlIGJvZy1zdGFuZGFyZCBt
dWx0aXBsZSB2aXJ0dWFsIGxvZ2luIGNvbnNvbGVzCj4+ID4gICogc2VwYXJhdGlvbiBvZiBkZWJ1
ZyBtZXNzYWdlcyAoc3Rkb3V0L3N0ZGVycikgdG8gZWFzZSBkZWJ1Z2dpbmcgYW5kCj4+ID4gZGV2
ZWxvcG1lbnQKPj4gPiAgKiByZW1vdGUgYW5kIHZpcnR1YWwgT3Blbk9DRCBhbmQga2VybmVsIGRl
YnVnZ2luZyB3aXRob3V0IGRpc3J1cHRpbmcKPj4gPiB0aGUgbWFpbiBzZXJpYWwgY29uc29sZQo+
PiA+ICAqIFBQUCBzZXJpYWwgbGlua3MuCj4+ID4KPj4gPiB0aGlzIGxhdHRlciBpcyBvbmUgdGhh
dCBpIGFtIHBhcnRpY3VsYXJseSBpbnRlcmVzdGVkIGluLCBhcyBpIHdvdWxkCj4+ID4gbGlrZSB0
byBiZSBhYmxlIHRvIGJvb3QgYSBmdWxsIEdOVS9MaW51eCBPUyBvbiBzcGlrZSwgZ2l2ZW4gdGhl
IGxvd2VyCj4+ID4gYmFycmllciB0byBlbnRyeSBpbiBtYWtpbmcgbW9kaWZpY2F0aW9ucyBhbmQg
ZXhwZXJpbWVudGluZyB3aXRoIHNwaWtlCj4+ID4gdGhhbiBpdCBpcyB3aXRoIHFlbXUuCj4+ID4K
Pj4gPiAgaWYgc3Bpa2Ugd2VyZSBhYmxlLCB0aHJvdWdoIGEgbXVsdGktc2VyaWFsIFNCSSBpbnRl
cmZhY2UsIHRvIGhhdmUgYQo+PiA+IFBQUCBzZXJpYWwgbGluZSwgaXQgd291bGQgYmUgcG9zc2li
bGUgdG8gcnVuIGEgcm9vdCBORlMgKG9yIG90aGVyCj4+ID4gbmV0d29yayBibG9jayBkZXZpY2Up
IHdpdGhvdXQgaGF2aW5nIHRvIHNhY3JpZmljZSBjb25zb2xlIGFjY2Vzcy4gIGl0Cj4+ID4gd291
bGQgYmUgcG9zc2libGUgdG8gY3JlYXRlIGFuIGluaXRyYW1mcyBmcm9tIGEgbG93ZXItY2FwYWJp
bGl0eQo+PiA+IHN5c3RlbSBsaWtlIGJ1aWxkcm9vdCwgY29udGFpbmluZyBQUFAsIGVuYWJsZSBp
dCwgYW5kIHBpdm90LXJvb3Qgb3V0Cj4+ID4gdG8gYSBmdWxsIHN0b2NrIEdOVS9MaW51eCBPUyBz
dWNoIGFzIGRlYmlhbiBvciBmZWRvcmEuCj4+ID4KPj4gPiAgc28gdGhlcmUgYXJlIGh1Z2UgYmVu
ZWZpdHMsIHJlZHVjaW5nIHRoZSBkZXZlbG9wbWVudCBiYXJyaWVyIHRvIGVudHJ5Cj4+ID4gaW50
byBSSVNDLVYgZXhwZXJpbWVudGF0aW9uIGFuZCBkZWJ1Z2dpbmcsIGFuZCBvcGVuaW5nIHVwIGEg
bXVjaCB3aWRlcgo+PiA+IHJhbmdlIG9mIGNhcGFiaWxpdGllcyBhbmQgcG9zc2liaWxpdGllcyBm
b3IgbWFjaGluZSBhbmQgdmlydHVhbCBzeXN0ZW0KPj4gPiBtYW5hZ2VtZW50Lgo+PiA+Cj4+ID4g
bC4KPj4gCj4+IAo+PiBUaGUgY3VycmVudCBTQkkgc2F5cyB0aGF0IGNvbnNvbGVfZ2V0Y2hhci9j
b25zb2xlX3B1dGNoYXIgYXJlIGZvciB0aGUKPj4gZGVidWcKPj4gY29uc29sZSBidXQgb24gTGlu
dXggd2UgdXNlIHRoZW0gZm9yIHRoZSBtYWluIGNvbnNvbGUgb24gZWFybHlwcmludGsuCj4gCj4g
IC4uLiB5ZWFoIGV4YWN0bHkuICBhbmQgd2hhdCBpZiBzb21ldGhpbmcgZ29lcyB3cm9uZywgeW91
IHdhbnQgdG8gYmUKPiBhYmxlIHRvIGludGVyYWN0IG92ZXIgb3Blbm9jZCB3aXRob3V0IGludGVy
ZmVyaW5nIHdpdGggdGhhdAo+IGVhcmx5cHJpbnRrLCBwYXJ0aWN1bGFybHkgZHVyaW5nIHRoYXQg
Y3JpdGljYWwgZmlyc3QgYnJpbmd1cCBwaGFzZSBvZgo+IHJlYWwtd29ybGQgc2lsaWNvbj8KPiAK
CldoYXQgZG9lcyBvcGVub2NkIGhhcyB0byBkbyB3aXRoIHRoZSBjb25zb2xlID8gRWFybHlwcmlu
dGsgaXMgb3V0cHV0Cm9ubHkgYnR3LiBUaGUgcG9pbnQgaGVyZSBpcyB0aGF0IHdlIG5lZWQgdG8g
dXBkYXRlIHRoZSBkb2N1bWVudGF0aW9uCmJlY2F1c2UgaXQncyBtaXNsZWFkaW5nLCB3ZSBkb24n
dCBoYXZlIGEgZGVidWcgY29uc29sZSBvbiB0aGUgY3VycmVudApTQkksIGp1c3QgYSBjb25zb2xl
LgoKPj4gSQo+PiB0aGluayBpdCdzIG1pc2xlYWRpbmcgYW5kIHdlIHNob3VsZCBhdCBsZWFzdCBo
YXZlIGFuIGFyZ3VtZW50IHRvIGNob3NlCj4+IGJldHdlZW4gdGhlIG1haW4gY29uc29sZSBhbmQg
YW4gb3B0aW9uYWwgZGVidWcgY29uc29sZSwgb3IgcmVuYW1lCj4+IHRoZW0gdG8gZGVidWdfY29u
c29sZV9nZXRjaGFyL2RlYnVnX2NvbnNvbGVfcHV0Y2hhciBhbmQKPj4gbWFpbl9jb25zb2xlX2dl
dGNoYXIvCj4+IG1haW5fY29uc29sZV9wdXRjaGFyLgo+IAo+ICBpIGluaXRpYWxseSB0aG91Z2h0
IG9mIHByb3Bvc2luZyB0aGF0LCBob3dldmVyOgo+IAo+ICAoMSkgdGhlIEFQSSBhbHJlYWR5IGV4
aXN0cyB3aXRoICJzaW5nbGUgY29uc29sZSIuIGl0IHdvdWxkIHRoZXJlZm9yZQo+IGJlIGRpc3J1
cHRpdmUgdG8gY2hhbmdlIHRoYXQKPiAKPiAgKDIpIGlmIGFkZGluZyBzb21ldGhpbmcgY2FsbGVk
IGRlYnVnX2NvbnNvbGVfe2dldC9wdXR9Y2hhciwgaXQgbWlnaHQKPiBhcyB3ZWxsIHRha2UgYWR2
YW50YWdlIG9mIHRoZSBvcHBvcnR1bml0eSB0byBiZSBleHRlbmRlZCBhbmQgbWFkZQo+IGdlbmVy
aWMsIGFuZCBoYXZlIHRoZSBleHRyYSBhcmd1bWVudCBhZGRlZAo+IAoKSSdtIG5vdCBpbiBmYXZv
ciBvZiBtYWluX2NvbnNvbGVfZ2V0Y2hhci9kZWJ1Z19jb25zb2xlX2dldGNoYXIgZXRjLCBJCmp1
c3Qgd2FudGVkIHRvIHBvaW50IG91dCB0aGF0IHRoZSBBUEkgc2hvdWxkIGJlIGNsZWFyIGFib3V0
IHdoYXQKY29uc29sZSBpcyB0byBiZSB1c2VkLCBub3QgYnkgdXNpbmcgYSBzZXJpYWwgbGluZSBp
ZCBidXQgYW4gaWQKdGhhdCBkZXNjcmliZXMgaXRzIHVzYWdlLgoKPj4gSG93ZXZlciBJIGRvbid0
IHRoaW5rIHRoYXQgYXJndW1lbnQgc2hvdWxkIGJlIHRoZSBzZXJpYWwgbGluZS4gCj4+IERpZmZl
cmVudAo+PiB2ZW5kb3JzIG1heSB1c2UgZGlmZmVyZW50IHNlcmlhbCBsaW5lcyBmb3IgdGhlIG1h
aW4gY29uc29sZSAvIGRlYnVnCj4+IGNvbnNvbGUsCj4+IHRoZSBjYWxsZXIgZG9lc24ndCBrbm93
IHdoaWNoIHNlcmlhbCBsaW5lIG1hcHMgdG8gd2hpY2ggY29uc29sZSwgc28gCj4+IHRoZQo+PiBT
QkkKPj4gc2hvdWxkIGJlIG1vcmUgYWJzdHJhY3QgYW5kIHVzZSBzb21ldGhpbmcgbGlrZSBhIGNv
bnNvbGUgaWQgd2hlcmUgZS5nLiAKPj4gMAo+PiBpcwo+PiBtYWluIGNvbnNvbGUgYW4gMSBpcyBk
ZWJ1Zy4KPiAKPiAgeWVzLCBpdCBzaG91bGQgW2hhdmVdOiBteSBmZWVsaW5nIGlzLCBpdCdzIGEg
bGl0dGxlIGxhdGUgaW4gdGhlIGdhbWUKPiBnaXZlbiB0aGF0IGl0J3MgYWxtb3N0IGNlcnRhaW5s
eSBiYWtlZCBpbnRvIHByZS1leGlzdGluZyBoYXJkd2FyZSwgYnkKPiBub3csIHNvIHRoZSBuZXh0
IGJlc3QgdGhpbmcgaXMgYSBuZXcgZnVuY3Rpb24gY2FsbC4KPiAKPiBsLgoKTGF0ZSBpbiB0aGUg
Z2FtZSA/IFdobydzIGdhbWUgPyBJcyB0aGVyZSBhbnkgInN0YW5kYXJkIiB3YXkgb3V0IHRoZXJl
CmZvciBtYXBwaW5nIGNvbnNvbGVzIHRvIHNlcmlhbCBsaW5lIGluZGljZXMgPwoKUmVnYXJkcywK
TmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C94C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 20:05:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B1742311B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 20:05:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B1742311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=noUIx6Oq2Pky8Ie4MNVuDsyjXXHFEKEtDF0T/5sxnjg=; b=mm4Lhnu8x1qvE3dl0NMYIeprH
	DLoatspROQu08nQijjYrBF3SsGutebsI/Igx2In8KSFPyD5qdbP8yFxNevk+GaR6iMgfPny9xk49s
	ztPNYttWgmaI0RjNydVk2qN4IQUXDzpZnPTR7croH8IJyGruizpCsxJ5gDOEgj+c8YQP/6LlKaEL1
	9XYZ02NEglBXyBRv0HZJOQyq20fGfVtFNMuTemGM0lRIRfysUpNbaaf3pqDwaxkY5Bf61t0mj4Xx/
	eT9qrZawuRcDSpRAEYeSh5+W0/EYALGDPB723vxV/wGw3+bnXBPweQJlNDbJOKrs2Tl+Amf/XfBsm
	N+T9Ed2mQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kldoI-0000Mc-6E; Sat, 05 Dec 2020 20:05:38 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kldoE-0000MI-9R
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 20:05:35 +0000
Received: from [192.168.1.155] ([95.117.6.188]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MKbPg-1kSsSo2JCe-00KvFk; Sat, 05 Dec 2020 21:05:18 +0100
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <e69569b5-0c45-e072-5de4-81a4acecdae3@metux.net>
Date: Sat, 5 Dec 2020 21:05:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201205142218-mutt-send-email-mst@kernel.org>
Content-Language: tl
X-Provags-ID: V03:K1:QugltoubQsv7+6FipOEchA2SlXCGRjERRAI/iuCtMDvu9KDBRRq
 saQTyePYS/E5loL/IxLrDFxgvPJ5JGmBzjTKIcVIrHGc/f9AGEkatuhoHw3jThMUeX5Ck8N
 ZMgEGXkxFB7huSU0tSGiu9ycGb4dQB+6+3LD3fCzBbfr+/KPagDfjvKGE3ZWg5Rkw2ZXhVY
 ZWUytYSOdq9CBmccEdCYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2it/pa0pkAM=:oFJFH+K8FRt4xExK6On0dO
 IFQ4fpnbkvP9d1krIcL/bcTDB2bAF0+lBGVmZa9S1za8Jrc/uZtc8/+jHtAgwrYp+v5g33ZaR
 m+A6CYjJC2IGU3h400s3xfPZKdRDKK4XCZqd4PFQOU/x5g2EjxnlDfteF6Ao/JBNWIdC7qDbT
 RUp+t3icVWxWEDISAetAMkDqbwY4bd9ygxbehmHiFzeY6Xf5F1O6LzWtu4VhYKvnchqhqPfdG
 FYNj0m7RzUP+szC8fWKQeVfmfCQluY/ppzurcFmlMkIZEbZq48JZv1wEmurUS4qNDiOWMJUyG
 UoqkrpJG/4p4FSrepw7H+NefIpsJqm8cPwM58vwmyxWULjoNJKwtGRQU3A2r18InX7oyUlXFM
 H0Ei0ybi98Tuggk8+zRcKWbh8Ji1tUBVGCNE36E1Hf/7X0kBrLhGGHsaWlnk9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_150534_935131_AE3FD03D 
X-CRM114-Status: GOOD (  20.78  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: stefanha@redhat.com, corbet@lwn.net, Jason Wang <jasowang@redhat.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, msuchanek@suse.de,
 "Enrico Weigelt, metux IT consult" <info@metux.net>, linus.walleij@linaro.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDUuMTIuMjAgMjA6MzIsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKCkhpLAoKPiBJdCBz
ZWVtcyBhIGJpdCBvZiBhIG1lc3MsIGF0IHRoaXMgcG9pbnQgSSdtIG5vdCBlbnRpcmVseSBzdXJl
IHdoZW4KPiBzaG91bGQgZHJpdmVycyBzZWxlY3QgVklSVElPIGFuZCB3aGVuIGRlcGVuZCBvbiBp
dC4KCmlmIFZJUlRJTyBqdXN0IGVuYWJsZXMgc29tZXRoaW5nIHRoYXQgY291bGQgYmUgc2VlbiBh
cyBsaWJyYXJ5CmZ1bmN0aW9ucywgdGhlbiBzZWxlY3Qgc2hvdWxkIGJlIHJpZ2h0LCBJTUhPLgoK
PiBUaGUgdGV4dCBuZWFyIGl0IHNheXM6Cj4gCj4gIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
R1BMLTIuMC1vbmx5Cj4gY29uZmlnIFZJUlRJTwo+ICAgICAgICAgdHJpc3RhdGUKCm9oLCB3YWl0
LCBkb2Vzbid0IGhhdmUgYW4gbWVudSB0ZXh0LCBzbyB3ZSBjYW4ndCBldmVuIGV4cGxpY2l0bHkg
ZW5hYmxlCml0IChub3Qgc2hvd24gaW4gbWVudSkgLSBvbmx5IGltcGxpY2l0bHkuIFdoaWNoIG1l
YW5zIHRoYXQgc29tZSBvdGhlcgpvcHRpb24gbXVzdCBzZWxlY3QgaXQsIGluIG9yZGVyIHRvIGJl
Y29tZSBhdmFpbGUgYXQgYWxsLCBhbmQgaW4gb3JkZXIKdG8gbWFrZSBvdGhlcnMgZGVwZW5kaW5n
IG9uIGl0IGJlY29taW5nIGF2YWlsYWJsZS4KCklNSE8sIHRoZXJlZm9yZSBzZWxlY3QgaXMgdGhl
IGNvcnJlY3QgYXBwcm9hY2guCgoKPiAgICAgICAgIGhlbHAKPiAgICAgICAgICAgVGhpcyBvcHRp
b24gaXMgc2VsZWN0ZWQgYnkgYW55IGRyaXZlciB3aGljaCBpbXBsZW1lbnRzIHRoZSB2aXJ0aW8K
PiAgICAgICAgICAgYnVzLCBzdWNoIGFzIENPTkZJR19WSVJUSU9fUENJLCBDT05GSUdfVklSVElP
X01NSU8sIENPTkZJR19SUE1TRwo+ICAgICAgICAgICBvciBDT05GSUdfUzM5MF9HVUVTVC4KPiAK
PiBXaGljaCBzZWVtcyBjbGVhciBlbm91Z2ggYW5kIHdvdWxkIGluZGljYXRlIGRyaXZlcnMgZm9y
IGRldmljZXMgKmJlaGluZCoKPiB0aGUgYnVzIHNob3VsZCBub3Qgc2VsZWN0IFZJUlRJTyBhbmQg
dGh1cyBwcmVzdW1hYmx5IHNob3VsZCAiZGVwZW5kIG9uIiBpdC4KPiBUaGlzIGlzIHZpb2xhdGVk
IGluIHZpcnRpbyBjb25zb2xlIGFuZCB2aXJ0aW8gZnMgZHJpdmVycy4KClNlZSBhYm92ZTogTkFL
LiBiZWNhdXNlIGl0IGNhbid0IGV2ZW4gYmUgZW5hYmxlZCBkaXJlY3RseSAoYnkgdGhlIHVzZXIp
LgpJZiBpdCB3YXNuJ3QgbWVhbnQgb3RoZXJ3aXNlLCB3ZSdkIGhhdmUgdG8gYWRkIGFuIG1lbnUg
dGV4dC4KCj4gRm9yIGNvbnNvbGUgaXQgc2F5czoKPiAKPiBjb21taXQgOWYzMGViMjljNTE0NTg5
ZTE2ZjI5OTllYTA3MDU5ODU4M2QxZjZlYwo+IEF1dGhvcjogTWljaGFsIFN1Y2hhbmVrIDxtc3Vj
aGFuZWtAc3VzZS5kZT4KPiBEYXRlOiAgIE1vbiBBdWcgMzEgMTg6NTg6NTAgMjAyMCArMDIwMAo+
IAo+ICAgICBjaGFyOiB2aXJ0aW86IFNlbGVjdCBWSVJUSU8gZnJvbSBWSVJUSU9fQ09OU09MRS4K
PiAgICAgCj4gICAgIE1ha2UgaXQgcG9zc2libGUgdG8gaGF2ZSB2aXJ0aW8gY29uc29sZSBidWls
dC1pbiB3aGVuCj4gICAgIG90aGVyIHZpcnRpbyBkcml2ZXJzIGFyZSBtb2R1bGFyLgo+ICAgICAK
PiAgICAgU2lnbmVkLW9mZi1ieTogTWljaGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4K
PiAgICAgUmV2aWV3ZWQtYnk6IEFtaXQgU2hhaCA8YW1pdEBrZXJuZWwub3JnPgo+ICAgICBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAwODMxMTY1ODUwLjI2MTYzLTEtbXN1Y2hh
bmVrQHN1c2UuZGUKPiAgICAgU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiAKPiB3aGljaCBzZWVtcyBraW5kIG9mIGJvZ3VzIC0g
d2h5IGRvIHdlIGNhcmUgYWJvdXQgYWxsb3dpbmcgYSBidWlsdGluCj4gdmlydGlvIGNvbnNvbGUg
ZHJpdmVyIGlmIHRoZSBwY2kgdmlydGlvIGJ1cyBkcml2ZXIgaXMgYSBtb2R1bGU/Cj4gVGhlcmUg
d29uJ3QgYmUgYW55IGRldmljZXMgb24gdGhlIGJ1cyB0byBhdHRhY2ggdG8gLi4uCgpXaGVuIHVz
aW5nIG90aGVyIHRyYW5zcG9ydHMgPwpJbiBteSBjdXJyZW50IHByb2plY3QsIGVnLiBJJ20gdXNp
bmcgbW1pbyAtIG15IGtlcm5lbCBoYXMgcGNpIGNvbXBsZXRlbHkKZGlzYWJsZWQuCgo+IEkgYW0g
aW5jbGluZWQgdG8gZml4IGNvbnNvbGUgYW5kIHZpcnRpbyBmcyB0byBkZXBlbmQgb24gVklSVElP
Ogo+IHNlbGVjdCBpcyBoYXJkZXIgdG8gdXNlIGNvcnJlY3RseSAuLi4KCkkgZG9uJ3QgdGhpbmt0
IHRoYXQgd291bGQgYmUgZ29vZCAtIGluc3RlYWQgZXZlcnlib2R5IHNob3VsZCBqdXN0IHNlbGVj
dApWSVJUSU8sIG5ldmVyIGRlcGVuZCBvbiBpdCAobWF5YmUgZGVwZW5kIG9uIFZJUlRJT19NRU5V
IGluc3RlYWQpCgoKLS1tdHgKCi0tIAotLS0KSGlud2VpczogdW52ZXJzY2hsw7xzc2VsdGUgRS1N
YWlscyBrw7ZubmVuIGxlaWNodCBhYmdlaMO2cnQgdW5kIG1hbmlwdWxpZXJ0CndlcmRlbiAhIEbD
vHIgZWluZSB2ZXJ0cmF1bGljaGUgS29tbXVuaWthdGlvbiBzZW5kZW4gU2llIGJpdHRlIGlocmVu
CkdQRy9QR1AtU2NobMO8c3NlbCB6dS4KLS0tCkVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25z
dWx0CkZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5nCmluZm9AbWV0
dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK

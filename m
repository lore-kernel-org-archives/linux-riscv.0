Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C411DC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 01:10:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1957C6112F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 01:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1957C6112F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bpeUWA0ebCp1p9x1ZuDsUsU+kE9LBbGkLqftNhQ3PEk=; b=HjhVuaiChL7TNxVy5i3zFH8bK
	Fp0CpFpGnXMq0hZJklDGNgbW4XnIEUeuUkcPZecrLwBB+4RuLm9wyzbYv4S3Ba/m32GPw3TMTnhg4
	CpAMVabpTKFXulbYkDztu2RCMvqMJvZBBTc2XLeHLW2MKUmCVD8ADSkLawUmEO36TfZeLTldYJ4hb
	J1oBwU3rhV4zk2CWkJk/lB5qcZ7MhF7DwP/XjUT/cR5FwTbGuddrW/jWyISxRa62u5pkYw/AwXBRE
	dFwF/Ub27ppds11To7aCw5hU5QuGXG3y+OoZVcGqfK76xek5Hxa6RjSvmP7tB1Ps4jfj6F+IBtpLE
	14St/5PpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljAio-002Kab-2b; Wed, 19 May 2021 01:10:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljAik-002KaB-SL
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 01:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=A0Bo5CtsQsgz5SDjrQrDU9cAiU/YNwwEqHL7TPc3aoI=; b=wYSi2e8iW7WiFS71qx9dnCpjC0
 0jenrZM/jZin+6cIOu2y+NXpj6wEWg4h//NzASZ8vjPIes7fre0Cz9ZXi6OnET7nxWXPY/klCbcFn
 P+Us7gXZ247KBguxCi7Y0kHpTTwqw5lvojMLCBVnMkTr9pWNXqV2v+7wNPfqIZlnWyxEb1o0Wz+PB
 +uvAh1F4l1EtNYgUFlFArtp7mgMBYJvK/MzQjPzM9V3EKfvc6HCMcJ4HjT8wjPpO1Risd6ojBTXB+
 voM4e8ltr4AuxqpE8Hm5Fr/oNMPy73qiejriiYgXLTsKIAZ7AqH3rSINNNa2W6airUuvLYeqZ3lHD
 A7M9oqQg==;
Received: from ozlabs.org ([2401:3900:2:1::2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljAih-00F3qh-EO
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 01:09:57 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FlFCD2wYLz9sTD;
 Wed, 19 May 2021 11:09:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1621386586;
 bh=UCeiL9QFW+a7PCn8oeEp01d3KWoBysRALLIYZbpvvyE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jNMRRWQ5yquDKv5DX8yudzgOyHyXimeCXk58EnQLYq8E47ViUTgZH9w+5HYVDjLF4
 mntXHpaeTTUZFgzsBaReFbLJf6trEFog30nCXNXdpx0x1gsPCRGT6CaM37uKpj2hgK
 QDATBwXulF1TDjeCzpMIxpGOswxnEUEg0uqMjh9RQbKRELZjt+RGu9RH6BUH9Osu6D
 k4TTNX7Y+eZ1oHS6UxOzZZOmUA3SQ/KhO5pZQ29763NNKcQy77CSQiQgQ4MN1D2gcb
 MWdS64ItBYLx7Z7q7y6ZBNd9kaZSkMrIfH76llm0HO0lP6OnYKXgK9g/vaiX0fzyJ4
 wGvrtp4K4Q1NQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexandre Ghiti <alex@ghiti.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v6 2/3] powerpc: Move script to check relocations at
 compile time in scripts/
In-Reply-To: <20210518101252.1484465-3-alex@ghiti.fr>
References: <20210518101252.1484465-1-alex@ghiti.fr>
 <20210518101252.1484465-3-alex@ghiti.fr>
Date: Wed, 19 May 2021 11:09:39 +1000
Message-ID: <877djvjzqk.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_180955_725371_754C5A86 
X-CRM114-Status: GOOD (  22.63  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0ZXM6Cj4gUmVsb2NhdGluZyBrZXJu
ZWwgYXQgcnVudGltZSBpcyBkb25lIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2Vzcywgc28K
PiBpdCBpcyBub3QgY29udmVuaWVudCB0byBjaGVjayBmb3IgcmVsb2NhdGlvbnMgdGhlcmUgYW5k
IHJlYWN0IGluIGNhc2UgYQo+IHJlbG9jYXRpb24gd2FzIG5vdCBleHBlY3RlZC4KPgo+IFBvd2Vy
cGMgYXJjaGl0ZWN0dXJlIGhhcyBhIHNjcmlwdCB0aGF0IGFsbG93cyB0byBjaGVjayBhdCBjb21w
aWxlIHRpbWUKPiBmb3Igc3VjaCB1bmV4cGVjdGVkIHJlbG9jYXRpb25zOiBleHRyYWN0IHRoZSBj
b21tb24gbG9naWMgdG8gc2NyaXB0cy8KPiBzbyB0aGF0IG90aGVyIGFyY2hpdGVjdHVyZXMgY2Fu
IHRha2UgYWR2YW50YWdlIG9mIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEdoaXRp
IDxhbGV4QGdoaXRpLmZyPgo+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1
bHQub3JnPgo+IC0tLQo+ICBhcmNoL3Bvd2VycGMvdG9vbHMvcmVsb2NzX2NoZWNrLnNoIHwgMTgg
KystLS0tLS0tLS0tLS0tLS0tCj4gIHNjcmlwdHMvcmVsb2NzX2NoZWNrLnNoICAgICAgICAgICAg
fCAyMCArKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA3NTUgc2NyaXB0cy9yZWxv
Y3NfY2hlY2suc2gKCkknbSBub3Qgc3VyZSB0aGF0IHNjcmlwdCBpcyByZWFsbHkgYmlnL2NvbXBs
aWNhdGVkIGVub3VnaCB0byB3YXJyYW50CnNoYXJpbmcgdnMganVzdCBjb3B5aW5nLCBidXQgSSBk
b24ndCBtaW5kIGVpdGhlci4KCkFja2VkLWJ5OiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJt
YW4uaWQuYXU+IChwb3dlcnBjKQoKY2hlZXJzCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
dG9vbHMvcmVsb2NzX2NoZWNrLnNoIGIvYXJjaC9wb3dlcnBjL3Rvb2xzL3JlbG9jc19jaGVjay5z
aAo+IGluZGV4IDAxNGUwMGU3NGQyYi4uZTM2Nzg5NTk0MWFlIDEwMDc1NQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy90b29scy9yZWxvY3NfY2hlY2suc2gKPiArKysgYi9hcmNoL3Bvd2VycGMvdG9vbHMv
cmVsb2NzX2NoZWNrLnNoCj4gQEAgLTE1LDIxICsxNSw4IEBAIGlmIFsgJCMgLWx0IDMgXTsgdGhl
bgo+ICAJZXhpdCAxCj4gIGZpCj4gIAo+IC0jIEhhdmUgS2J1aWxkIHN1cHBseSB0aGUgcGF0aCB0
byBvYmpkdW1wIGFuZCBubSBzbyB3ZSBoYW5kbGUgY3Jvc3MgY29tcGlsYXRpb24uCj4gLW9iamR1
bXA9IiQxIgo+IC1ubT0iJDIiCj4gLXZtbGludXg9IiQzIgo+IC0KPiAtIyBSZW1vdmUgZnJvbSB0
aGUgYmFkIHJlbG9jYXRpb25zIHRob3NlIHRoYXQgbWF0Y2ggYW4gdW5kZWZpbmVkIHdlYWsgc3lt
Ym9sCj4gLSMgd2hpY2ggd2lsbCByZXN1bHQgaW4gYW4gYWJzb2x1dGUgcmVsb2NhdGlvbiB0byAw
Lgo+IC0jIFdlYWsgdW5yZXNvbHZlZCBzeW1ib2xzIGFyZSBvZiB0aGF0IGZvcm0gaW4gbm0gb3V0
cHV0Ogo+IC0jICIgICAgICAgICAgICAgICAgICB3IF9iaW5hcnlfX2J0Zl92bWxpbnV4X2Jpbl9l
bmQiCj4gLXVuZGVmX3dlYWtfc3ltYm9scz0kKCRubSAiJHZtbGludXgiIHwgYXdrICckMSB+IC93
LyB7IHByaW50ICQyIH0nKQo+IC0KPiAgYmFkX3JlbG9jcz0kKAo+IC0kb2JqZHVtcCAtUiAiJHZt
bGludXgiIHwKPiAtCSMgT25seSBsb29rIGF0IHJlbG9jYXRpb24gbGluZXMuCj4gLQlncmVwIC1F
ICdcPFJfJyB8Cj4gKyR7c3JjdHJlZX0vc2NyaXB0cy9yZWxvY3NfY2hlY2suc2ggIiRAIiB8Cj4g
IAkjIFRoZXNlIHJlbG9jYXRpb25zIGFyZSBva2F5Cj4gIAkjIE9uIFBQQzY0Ogo+ICAJIwlSX1BQ
QzY0X1JFTEFUSVZFLCBSX1BQQzY0X05PTkUKPiBAQCAtNDMsOCArMzAsNyBAQCBSX1BQQ19BRERS
MTZfTE8KPiAgUl9QUENfQUREUjE2X0hJCj4gIFJfUFBDX0FERFIxNl9IQQo+ICBSX1BQQ19SRUxB
VElWRQo+IC1SX1BQQ19OT05FJyB8Cj4gLQkoWyAiJHVuZGVmX3dlYWtfc3ltYm9scyIgXSAmJiBn
cmVwIC1GIC13IC12ICIkdW5kZWZfd2Vha19zeW1ib2xzIiB8fCBjYXQpCj4gK1JfUFBDX05PTkUn
Cj4gICkKPiAgCj4gIGlmIFsgLXogIiRiYWRfcmVsb2NzIiBdOyB0aGVuCj4gZGlmZiAtLWdpdCBh
L3NjcmlwdHMvcmVsb2NzX2NoZWNrLnNoIGIvc2NyaXB0cy9yZWxvY3NfY2hlY2suc2gKPiBuZXcg
ZmlsZSBtb2RlIDEwMDc1NQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTM3YzY2MDQ5OWYzCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3NjcmlwdHMvcmVsb2NzX2NoZWNrLnNoCj4gQEAgLTAsMCArMSwy
MCBAQAo+ICsjIS9iaW4vc2gKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
ci1sYXRlcgo+ICsKPiArIyBHZXQgYSBsaXN0IG9mIGFsbCB0aGUgcmVsb2NhdGlvbnMsIHJlbW92
ZSBmcm9tIGl0IHRoZSByZWxvY2F0aW9ucwo+ICsjIHRoYXQgYXJlIGtub3duIHRvIGJlIGxlZ2l0
aW1hdGUgYW5kIHJldHVybiB0aGlzIGxpc3QgdG8gYXJjaCBzcGVjaWZpYwo+ICsjIHNjcmlwdCB0
aGF0IHdpbGwgbG9vayBmb3Igc3VzcGljaW91cyByZWxvY2F0aW9ucy4KPiArCj4gK29iamR1bXA9
IiQxIgo+ICtubT0iJDIiCj4gK3ZtbGludXg9IiQzIgo+ICsKPiArIyBSZW1vdmUgZnJvbSB0aGUg
cG9zc2libGUgYmFkIHJlbG9jYXRpb25zIHRob3NlIHRoYXQgbWF0Y2ggYW4gdW5kZWZpbmVkCj4g
KyPCoHdlYWsgc3ltYm9sIHdoaWNoIHdpbGwgcmVzdWx0IGluIGFuIGFic29sdXRlIHJlbG9jYXRp
b24gdG8gMC4KPiArIyBXZWFrIHVucmVzb2x2ZWQgc3ltYm9scyBhcmUgb2YgdGhhdCBmb3JtIGlu
IG5tIG91dHB1dDoKPiArIyAiICAgICAgICAgICAgICAgICAgdyBfYmluYXJ5X19idGZfdm1saW51
eF9iaW5fZW5kIgo+ICt1bmRlZl93ZWFrX3N5bWJvbHM9JCgkbm0gIiR2bWxpbnV4IiB8IGF3ayAn
JDEgfiAvdy8geyBwcmludCAkMiB9JykKPiArCj4gKyRvYmpkdW1wIC1SICIkdm1saW51eCIgfAo+
ICsJZ3JlcCAtRSAnXDxSXycgfAo+ICsJKFsgIiR1bmRlZl93ZWFrX3N5bWJvbHMiIF0gJiYgZ3Jl
cCAtRiAtdyAtdiAiJHVuZGVmX3dlYWtfc3ltYm9scyIgfHwgY2F0KQo+IC0tIAo+IDIuMzAuMgo+
Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==

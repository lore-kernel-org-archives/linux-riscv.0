Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A8BEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2MhfC8bFNn5da7DSSVUEHcrV+LI2siaY79TVWIEUqXs=; b=xu4s95LHsLbOLH
	ZTAhhXdDnIM9UbozkgTRBNTJkPNM11pwsJpYmq3WEPINQUZbDAO7eTHTPSkOtrEZBElRkf+8lFkR3
	8o3H/8VK87OR2OKFVoLSFlGFm3DnZlzHnotGWThKpiUUD1s77a+ZNb8xLwqOK3XBI2BuwBw9KXoym
	Z5YVj43ny+ECmdFSvpK0Vo/RvucTO6b/USsMSXMV8FeOOljCQnB+HD6B6QR8CPFFyaGGeGOQLk8rZ
	7g6+M+zBM93rsK4AlT2tB0XmfX1oNkq/c+boRqN+GnLvEtP9SMtwRZDV24PlTWaauv4gSm6+xSObp
	20FRn+Y7DbenacGiDUYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPjG-00AUCo-35;
	Thu, 20 Jul 2023 09:13:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPjD-00AU9G-0W
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 09:13:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2F9960012;
	Thu, 20 Jul 2023 09:13:36 +0000 (UTC)
Message-ID: <90c8509f-bd0a-4996-adca-86f6116b5129@ghiti.fr>
Date: Thu, 20 Jul 2023 11:13:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/10] riscv: Allow userspace to directly access perf
 counters
Content-Language: en-US
To: Atish Patra <atishp@atishpatra.org>, =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?=
 <remi@remlab.net>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Aurelien Jarno <aurelien@aurel32.net>, Mathieu Malaterre <malat@debian.org>,
 Jan Newger <jannewger@google.com>
References: <20230703124647.215952-1-alexghiti@rivosinc.com>
 <8756384.Zvl9fuB8X0@basile.remlab.net>
 <CAOnJCU+W9u+HnMfjU_y9W7331Zx07eQs9R1twV0=KsBAeSMSjw@mail.gmail.com>
 <5951331.lOV4Wx5bFT@basile.remlab.net>
 <CAOnJCUKCx0Jh1igZytKAYePhhUBt=x5ANCVx4FRTbLtxGkyowA@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAOnJCUKCx0Jh1igZytKAYePhhUBt=x5ANCVx4FRTbLtxGkyowA@mail.gmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_021343_339774_163EE101 
X-CRM114-Status: GOOD (  14.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQXRpc2gsIFLDqW1pLAoKCk9uIDE5LzA3LzIwMjMgMTk6MTQsIEF0aXNoIFBhdHJhIHdyb3Rl
Ogo+IE9uIFdlZCwgSnVsIDE5LCAyMDIzIGF0IDc6NDbigK9BTSBSw6ltaSBEZW5pcy1Db3VybW9u
dCA8cmVtaUByZW1sYWIubmV0PiB3cm90ZToKPj4gTGUga2Vza2l2aWlra29uYSAxOS4gaGVpbsOk
a3V1dGEgMjAyMywgMS40OC40OSBFRVNUIEF0aXNoIFBhdHJhIGEgw6ljcml0IDoKPj4+PiBJc24n
dCBSRFRJTSBzdXNjZXB0aWJsZSB0byBpbnRlcmZlcmVuY2UgZnJvbSBwb3dlciBtYW5hZ2VtZW50
IGFuZCBDUFUKPj4+PiBmcmVxdWVuY3kgc2NhbGluZz8gSSBzdXBwb3NlIHRoYXQgUkRDWUNMRSBt
YXkgYmVoYXZlIGRpZmZlcmVudGx5IGRlcGVuZGluZwo+Pj4+IG9uIFBNIGluICpzb21lKiBkZXNp
Z25zLCBidXQgdGhhdCB3b3VsZCBzdGlsbCBiZSB3YXkgYmV0dGVyIHRoYW4gUkRUSU1FCj4+Pj4g
Zm9yIHRoZSBwdXJwb3NlLgo+Pj4gWWVzLiBCdXQgdGhhdCdzIHdoYXQgaXQgaXMgcHJvYmFibHkg
dXNpbmcgZm9yIG90aGVyIElTQXMgPwo+PiBBdCBsZWFzdCBvbiBBQXJjaDY0LCBpdCBpcyB1c2lu
ZyBlaXRoZXIgTGludXggcGVyZiBjeWNsZSBjb3VudGVyLCBvciBpZiB0aGF0Cj4+IGlzIGRpc2Fi
bGVkIGF0IGJ1aWxkIHRpbWUsIHRoZSByYXcgUE1VIGN5Y2xlIGNvdW50ZXIgLSB3aGljaCBvYnZp
b3VzbHkgbGVhZHMKPj4gdG8gU0lHSUxMIG9uIExpbnV4LCBqdXN0IGxpa2UgdGhpcyBNUiB3b3Vs
ZCBkbyB3aXRoIFJEQ1lDTEUuCj4+Cj4gR29vZCB0byBrbm93LiBUaGFua3MgZm9yIHRoZSBjbGFy
aWZpY2F0aW9uLgo+Cj4+IEFnYWluLCBJIGRvIG5vdCAqcGVyc29uYWxseSogaGF2ZSBvYmplY3Rp
b25zIHRvIGRpc2FibGluZyBSRENZQ0xFIGZvcgo+PiB1c2Vyc3BhY2UgKHNvbWVib2R5IGVsc2Ug
ZG9lcywgYnV0IHRoYXQncyBuZWl0aGVyIG15IG5vciB5b3VyIHByb2JsZW0pLiBJIGRvCj4+IGhh
dmUgb2JqZWN0aW9ucyB0byB0aGUgd29yZGluZyBvZiBzb21lIG9mIHRoZSBjb21taXQgbWVzc2Fn
ZXMgdGhvdWdoLgo+Pgo+IENvbXBsZXRlbHkgYWdyZWVkLiBXZSB3aWxsIHVwZGF0ZSB0aGUgY29t
bWl0IHRleHQgd2l0aCBtb3JlIGNsYXJpZmljYXRpb24gaW4gdjUuCgoKVGhhbmtzIGZvciBhbGwg
eW91ciBjb21tZW50cyBhbmQgc29ycnkgZm9yIGJlaW5nIHNsb3cgaGVyZS4gSSB3aWxsIAppbXBy
b3ZlIHRoZSBjb21taXQgbG9ncyBpbiB0aGUgbmV4dCB2ZXJzaW9uLCB0aGF0J3MgYW4gb3ZlcnNp
Z2h0LCBzb3JyeSAKYWJvdXQgdGhhdC4KClRoYW5rcyBhZ2FpbiwKCkFsZXgKCgo+Cj4+PiBNeSBw
b2ludCB3YXMgaXQgc2hvdWxkIGp1c3QgZG8gd2hhdGV2ZXIgaXQgZG9lcyBmb3Igb3RoZXIgSVNB
LiBSSVNDLVYgaXMgbm8KPj4+IHNwZWNpYWwgaW4gdGhhdCByZWdhcmQuCj4+IFN1cmUuIE15IHBv
aW50IGlzIHRoYXQgUkRUSU1FIG1heSBiZSBncmVhdCBmb3IsIHNvIHRvIHNheSwgc3lzdGVtLWxl
dmVsCj4+IGJlbmNobWFya3MuIEZvciBGRm1wZWcgdGhhdCBjb3VsZCBzb21ldGhpbmcgbGlrZSBo
b3cgbG9uZyBpdCB0YWtlcyB0bwo+PiB0cmFuc2NvZGUgYSB2aWRlby4gQnV0IGl0IGRvZXNuJ3Qg
c2VlbSB0byBtYWtlIG11Y2ggc2Vuc2UgZm9yCj4+IG1pY3JvYmVuY2htYXJraW5nIG9mIHNpbmds
ZSB0aHJlYWRlZCB0aWdodGx5IG9wdGltaXNlZCBsb29wcywgYXMgb3Bwb3NlZCB0bwo+PiBSRENZ
Q0xFIChvciBhIHdyYXBwZXIgZm9yIFJEQ1lDTEUpLgo+Pgo+PiAtLQo+PiBSw6ltaSBEZW5pcy1D
b3VybW9udAo+PiBodHRwOi8vd3d3LnJlbWxhYi5uZXQvCj4+Cj4+Cj4+Cj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK

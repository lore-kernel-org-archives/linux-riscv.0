Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A040E77179
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRiltQdkjWn3Smhf+LPHhd8SSVv0UCrBjrMXnrAaOYY=; b=nw6A+9lcOyNtyy
	RQeHFdkRFvjMjzPQIwyBuJU2gxL81G8cHM/yFQ+VV5iV0v8SQ0K5/qDfV9JVi2wDYR3emfZxule97
	Yxdf9IzZgFNci86Fk8Rxmb84oHkNIqS6YpLy+fOZ3Vu7l5DTLkKmH8BoQvVQYds0STaWlksCiuCkB
	kOzJqQ8XYXklfg1IrQ0RuLyK1U3YR/r5cF4DxQSnWmHsdALOxpJ1lwy2uHx9kjtsH2cPB3WysJEDm
	LDwpqPMxjrna63DmAkTHCaBe5pm3yRzN0lAMBXVYAKKigMTEGQOKMTK31YXtVeN/d/psV0Lwu0t7Y
	byE/SYwXcAvS08C66o+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZYO-00000001tIB-1Z3F;
	Fri, 06 Dec 2024 14:43:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJZXM-00000001tCq-1RWh;
	Fri, 06 Dec 2024 14:42:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 183BA5C6FCD;
	Fri,  6 Dec 2024 14:41:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0CCC4CED1;
	Fri,  6 Dec 2024 14:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733496151;
	bh=wSKSMzY8clOou1UTyR6gm5NyWmK0v9YfZdT8Yh6+g7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bgFr5gCRcA69qGtCcS8MDC4Q+JcKMTpT4o5EL3XTdBTHV7aQXHOpxaz2Khx01EnzV
	 O2IpQBIMNIidQeyUqFFA9Xd+VWd045Sq9DjXjezFuZCXZyNIlykTAZKOZRSFcX9kH6
	 ZAfXcoYhwp/1a5fcgb/XfBH5C+zhvr6Y9btiDTRs=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	James Clark <james.clark@linaro.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Bibo Mao <maobibo@loongson.cn>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
	Dima Kogan <dima@secretsauce.net>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiri Olsa <jolsa@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Leo Yan <leo.yan@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ravi Bangoria <ravi.bangoria@amd.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: [PATCH 6.12 066/146] perf jevents: fix breakage when do perf stat on system metric
Date: Fri,  6 Dec 2024 15:36:37 +0100
Message-ID: <20241206143530.207302746@linuxfoundation.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206143527.654980698@linuxfoundation.org>
References: <20241206143527.654980698@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_064232_468503_43B19AB2 
X-CRM114-Status: GOOD (  16.22  )
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

Ni4xMi1zdGFibGUgcmV2aWV3IHBhdGNoLiAgSWYgYW55b25lIGhhcyBhbnkgb2JqZWN0aW9ucywg
cGxlYXNlIGxldCBtZSBrbm93LgoKLS0tLS0tLS0tLS0tLS0tLS0tCgpGcm9tOiBYdSBZYW5nIDx4
dS55YW5nXzJAbnhwLmNvbT4KCmNvbW1pdCA0YTE1OWU2MDQ5ZjMxOWJlZjZmOWU2ZDJjY2RkMzIy
ZjU3ZDI0ODMwIHVwc3RyZWFtLgoKV2hlbiBkbyBwZXJmIHN0YXQgb24gc3lzIG1ldHJpYywgcGVy
ZiB0b29sIG91dHB1dCBub3RoaW5nIG5vdzoKCiAgJCBwZXJmIHN0YXQgLWEgLU0gaW14OTVfZGRy
X3JlYWQuYWxsIC1JIDEwMDAKICAkCgpUaGlzIGNvbW1hbmQgcnVucyBvbiBhbiBhcm02NCBtYWNo
aW5lIGFuZCB0aGUgU29jIGhhcyBvbmUgRERSIGh3IHBtdQpleGNlcHQgb25lIGFybXY4X2NvcnRl
eF9hNTUgcG11LiBUaGVpciBtYXBzIHNob3cgYXMgZm9sbG93czoKCmNvbnN0IHN0cnVjdCBwbXVf
ZXZlbnRzX21hcCBwbXVfZXZlbnRzX21hcFtdID0gewp7CgkuYXJjaCA9ICJhcm02NCIsCgkuY3B1
aWQgPSAiMHgwMDAwMDAwMDQxMGZkMDUwIiwKCS5ldmVudF90YWJsZSA9IHsKCQkucG11cyA9IHBt
dV9ldmVudHNfX2FybV9jb3J0ZXhfYTU1LAoJCS5udW1fcG11cyA9IEFSUkFZX1NJWkUocG11X2V2
ZW50c19fYXJtX2NvcnRleF9hNTUpCgl9LAoJLm1ldHJpY190YWJsZSA9IHsKCQkucG11cyA9IE5V
TEwsCgkJLm51bV9wbXVzID0gMAoJfQp9LAoKc3RhdGljIGNvbnN0IHN0cnVjdCBwbXVfc3lzX2V2
ZW50cyBwbXVfc3lzX2V2ZW50X3RhYmxlc1tdID0gewp7CgkuZXZlbnRfdGFibGUgPSB7CgkJLnBt
dXMgPSBwbXVfZXZlbnRzX19mcmVlc2NhbGVfaW14OTVfc3lzLAoJCS5udW1fcG11cyA9IEFSUkFZ
X1NJWkUocG11X2V2ZW50c19fZnJlZXNjYWxlX2lteDk1X3N5cykKCX0sCgkubWV0cmljX3RhYmxl
ID0gewoJCS5wbXVzID0gcG11X21ldHJpY3NfX2ZyZWVzY2FsZV9pbXg5NV9zeXMsCgkJLm51bV9w
bXVzID0gQVJSQVlfU0laRShwbXVfbWV0cmljc19fZnJlZXNjYWxlX2lteDk1X3N5cykKCX0sCgku
bmFtZSA9ICJwbXVfZXZlbnRzX19mcmVlc2NhbGVfaW14OTVfc3lzIiwKfSwKCkN1cnJlbnRseSwg
cG11X21ldHJpY3NfdGFibGVfX2ZpbmQoKSB3aWxsIHJldHVybiBOVUxMIHdoZW4gb25seSBkbyBw
ZXJmCnN0YXQgb24gc3lzIG1ldHJpYy4gVGhlbiBwYXJzZV9ncm91cHMoKSB3aWxsIG5ldmVyIGJl
IGNhbGxlZCB0byBwYXJzZQpzeXMgbWV0cmljX25hbWUsIGZpbmFsbHkgcGVyZiB0b29sIHdpbGwg
ZXhpdCBkaXJlY3RseS4gVGhpcyBzaG91bGQgYmUgYQpjb21tb24gcHJvYmxlbS4KClRvIGZpeCB0
aGUgaXNzdWUsIHRoaXMgd2lsbCBrZWVwIHRoZSBsb2dpYyBiZWZvcmUgY29tbWl0IGYyMGMxNWQx
M2YwMQooInBlcmYgcG11LWV2ZW50czogUmVtZW1iZXIgdGhlIHBlcmZfZXZlbnRzX21hcCBmb3Ig
YSBQTVUiKSB0byByZXR1cm4gYQplbXB0eSBtZXRyaWMgdGFibGUgcmF0aGVyIHRoYW4gYSBOVUxM
IHBvaW50ZXIuCgpUaGlzIHNob3VsZCBiZSBmaW5lIHNpbmNlIHRoZSByZW1vdmVkIHBhcnQganVz
dCBjaGVjayBpZiB0aGUgdGFibGUgbWF0Y2gKcHJvdmlkZWQgbWV0cmljX25hbWUuICBXaXRob3V0
IHRoZXNlIGNvZGUsIHRoZSBjb2RlIGluIHBhcnNlX2dyb3VwcygpCndpbGwgYWxzbyBjaGVjayB0
aGUgdmFsaWRpdHkgb2YgbWV0cmNpX25hbWUgdG9vLgoKRml4ZXM6IGYyMGMxNWQxM2YwMTdkNGIg
KCJwZXJmIHBtdS1ldmVudHM6IFJlbWVtYmVyIHRoZSBwZXJmX2V2ZW50c19tYXAgZm9yIGEgUE1V
IikKUmV2aWV3ZWQtYnk6IEphbWVzIENsYXJrIDxqYW1lcy5jbGFya0BsaW5hcm8ub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBYdSBZYW5nIDx4dS55YW5nXzJAbnhwLmNvbT4KVGVzdGVkLWJ5OiBYdSBZYW5n
IDx4dS55YW5nXzJAbnhwLmNvbT4KQWNrZWQtYnk6IElhbiBSb2dlcnMgPGlyb2dlcnNAZ29vZ2xl
LmNvbT4KQ2M6IEFkcmlhbiBIdW50ZXIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPgpDYzogQWxi
ZXJ0IE91IDxhb3VAZWVjcy5iZXJrZWxleS5lZHU+CkNjOiBBbGV4YW5kZXIgU2hpc2hraW4gPGFs
ZXhhbmRlci5zaGlzaGtpbkBsaW51eC5pbnRlbC5jb20+CkNjOiBBbGV4YW5kcmUgR2hpdGkgPGFs
ZXhnaGl0aUByaXZvc2luYy5jb20+CkNjOiBBdGhpcmEgUmFqZWV2IDxhdHJhamVldkBsaW51eC52
bmV0LmlibS5jb20+CkNjOiBCZW5qYW1pbiBHcmF5IDxiZ3JheUBsaW51eC5pYm0uY29tPgpDYzog
QmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+CkNjOiBCaWJvIE1hbyA8bWFv
Ymlib0Bsb29uZ3Nvbi5jbj4KQ2M6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZp
Y0Bmb3NzLnN0LmNvbT4KQ2M6IERpbWEgS29nYW4gPGRpbWFAc2VjcmV0c2F1Y2UubmV0PgpDYzog
RHIuIERhdmlkIEFsYW4gR2lsYmVydCA8bGludXhAdHJlYmxpZy5vcmc+CkNjOiBIdWFjYWkgQ2hl
biA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5j
b20+CkNjOiBKaXJpIE9sc2EgPGpvbHNhQGtlcm5lbC5vcmc+CkNjOiBKb2huIEdhcnJ5IDxqb2hu
LmcuZ2FycnlAb3JhY2xlLmNvbT4KQ2M6IEthbiBMaWFuZyA8a2FuLmxpYW5nQGxpbnV4LmludGVs
LmNvbT4KQ2M6IExlbyBZYW4gPGxlby55YW5AbGludXguZGV2PgpDYzogTWFyayBSdXRsYW5kIDxt
YXJrLnJ1dGxhbmRAYXJtLmNvbT4KQ2M6IE1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5l
bC5vcmc+CkNjOiBNaWtlIExlYWNoIDxtaWtlLmxlYWNoQGxpbmFyby5vcmc+CkNjOiBOYW1oeXVu
ZyBLaW0gPG5hbWh5dW5nQGtlcm5lbC5vcmc+CkNjOiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQGRh
YmJlbHQuY29tPgpDYzogUGF1bCBXYWxtc2xleSA8cGF1bC53YWxtc2xleUBzaWZpdmUuY29tPgpD
YzogUGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogUmF2aSBCYW5nb3Jp
YSA8cmF2aS5iYW5nb3JpYUBhbWQuY29tPgpDYzogU2FuZGlwYW4gRGFzIDxzYW5kaXBhbi5kYXNA
YW1kLmNvbT4KQ2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+CkNjOiBZaWNvbmcgWWFu
ZyA8eWFuZ3lpY29uZ0BoaXNpbGljb24uY29tPgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCkNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDEx
MDcxNjIwMzUuNTIyMDYtMi1pcm9nZXJzQGdvb2dsZS5jb20KU2lnbmVkLW9mZi1ieTogSWFuIFJv
Z2VycyA8aXJvZ2Vyc0Bnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBBcm5hbGRvIENhcnZhbGhv
IGRlIE1lbG8gPGFjbWVAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0
bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KLS0tCiB0b29scy9wZXJmL3BtdS1ldmVu
dHMvZW1wdHktcG11LWV2ZW50cy5jIHwgICAxMiArLS0tLS0tLS0tLS0KIHRvb2xzL3BlcmYvcG11
LWV2ZW50cy9qZXZlbnRzLnB5ICAgICAgICAgfCAgIDEyICstLS0tLS0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKLS0tIGEvdG9vbHMvcGVy
Zi9wbXUtZXZlbnRzL2VtcHR5LXBtdS1ldmVudHMuYworKysgYi90b29scy9wZXJmL3BtdS1ldmVu
dHMvZW1wdHktcG11LWV2ZW50cy5jCkBAIC01MzksMTcgKzUzOSw3IEBAIGNvbnN0IHN0cnVjdCBw
bXVfbWV0cmljc190YWJsZSAqcGVyZl9wbXUKICAgICAgICAgaWYgKCFtYXApCiAgICAgICAgICAg
ICAgICAgcmV0dXJuIE5VTEw7CiAKLSAgICAgICAgaWYgKCFwbXUpCi0gICAgICAgICAgICAgICAg
cmV0dXJuICZtYXAtPm1ldHJpY190YWJsZTsKLQotICAgICAgICBmb3IgKHNpemVfdCBpID0gMDsg
aSA8IG1hcC0+bWV0cmljX3RhYmxlLm51bV9wbXVzOyBpKyspIHsKLSAgICAgICAgICAgICAgICBj
b25zdCBzdHJ1Y3QgcG11X3RhYmxlX2VudHJ5ICp0YWJsZV9wbXUgPSAmbWFwLT5tZXRyaWNfdGFi
bGUucG11c1tpXTsKLSAgICAgICAgICAgICAgICBjb25zdCBjaGFyICpwbXVfbmFtZSA9ICZiaWdf
Y19zdHJpbmdbdGFibGVfcG11LT5wbXVfbmFtZS5vZmZzZXRdOwotCi0gICAgICAgICAgICAgICAg
aWYgKHBtdV9fbmFtZV9tYXRjaChwbXUsIHBtdV9uYW1lKSkKLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAmbWFwLT5tZXRyaWNfdGFibGU7Ci0gICAgICAgIH0KLSAgICAgICAgcmV0
dXJuIE5VTEw7CisJcmV0dXJuICZtYXAtPm1ldHJpY190YWJsZTsKIH0KIAogY29uc3Qgc3RydWN0
IHBtdV9ldmVudHNfdGFibGUgKmZpbmRfY29yZV9ldmVudHNfdGFibGUoY29uc3QgY2hhciAqYXJj
aCwgY29uc3QgY2hhciAqY3B1aWQpCi0tLSBhL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9qZXZlbnRz
LnB5CisrKyBiL3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9qZXZlbnRzLnB5CkBAIC0xMDg5LDE3ICsx
MDg5LDcgQEAgY29uc3Qgc3RydWN0IHBtdV9tZXRyaWNzX3RhYmxlICpwZXJmX3BtdQogICAgICAg
ICBpZiAoIW1hcCkKICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKIAotICAgICAgICBpZiAo
IXBtdSkKLSAgICAgICAgICAgICAgICByZXR1cm4gJm1hcC0+bWV0cmljX3RhYmxlOwotCi0gICAg
ICAgIGZvciAoc2l6ZV90IGkgPSAwOyBpIDwgbWFwLT5tZXRyaWNfdGFibGUubnVtX3BtdXM7IGkr
KykgewotICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwbXVfdGFibGVfZW50cnkgKnRhYmxl
X3BtdSA9ICZtYXAtPm1ldHJpY190YWJsZS5wbXVzW2ldOwotICAgICAgICAgICAgICAgIGNvbnN0
IGNoYXIgKnBtdV9uYW1lID0gJmJpZ19jX3N0cmluZ1t0YWJsZV9wbXUtPnBtdV9uYW1lLm9mZnNl
dF07Ci0KLSAgICAgICAgICAgICAgICBpZiAocG11X19uYW1lX21hdGNoKHBtdSwgcG11X25hbWUp
KQotICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuICZtYXAtPm1ldHJpY190YWJsZTsK
LSAgICAgICAgfQotICAgICAgICByZXR1cm4gTlVMTDsKKwlyZXR1cm4gJm1hcC0+bWV0cmljX3Rh
YmxlOwogfQogCiBjb25zdCBzdHJ1Y3QgcG11X2V2ZW50c190YWJsZSAqZmluZF9jb3JlX2V2ZW50
c190YWJsZShjb25zdCBjaGFyICphcmNoLCBjb25zdCBjaGFyICpjcHVpZCkKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

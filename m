Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3598BC49EA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkEp6c+Gy4Bu08AGHeYBmh7OOJP/QLAXUSuDPzIeuNE=; b=X1GB1NaPe0WufQ
	4YzxgwFAxbF+ZOiP9tCXi4QWMafSITRf9AIuX9/3FCNPYiTpD3nRTf4d1/EQFjhRehZrcQ6LlPOUj
	5s6HiUMBQtw5ypfcMXH4srZqP1YumJbaRSKaN1Yg18DtHrtrQ5HA8P4SKcAMKCNhKORrSKxThmsZ2
	ubUugXoE0fhAr6nForzUGNG62cPau3HOt3YRjq4jtoz1kXB29932B4P5rC2muQ39Vck39gCI2CzXH
	VQu2iibqGyla2OYakc8lIeayrChybT1PzIIT4UcFszrNgvzcBV/9RSKHUHHliMCF9gofOq2NLpArR
	ejrtUKbrk/h1gMitzQhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKaW-00000001rIZ-1TZV;
	Tue, 06 Aug 2024 13:50:56 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbKZm-00000001r3p-33Z3;
	Tue, 06 Aug 2024 13:50:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6CEFACE0B5F;
	Tue,  6 Aug 2024 13:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF8AC32786;
	Tue,  6 Aug 2024 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722952207;
	bh=ViNFQZX1KF1hgpgV7zrHw49j/8aYGn1Bq6dW4VSWMQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BhZvdBoZrlmlZpD01wdDp/IWpLtwBKX/SA9QtGZU9A8MTSXpgHAmxDVr5RxmMD9ZR
	 efw/I/gK/ELlECqGASEcUDUgXegxHJsPQrtU211cM6tK/lGd+j9f+LNG/DO0tmiYvR
	 0Cih9Gs+cEX8Rf8lfQjRFqEGQYNf9tKc6HvHOcQNtAg3nkinHVYSQ92RyHxuABfj0E
	 DWEhTjX9Z56jKtf6GNxwIGeoFPWvXAbBi42rdAEgY+NIRC7AhImGz0YPGnQTjy2HYT
	 6AqILYuQvu9QoLe4AZ7nuN5XSgq0zaHTaLA2k/mRNhhnl1McyTfJvN8ys8/KYC5b5+
	 5lcTx1P5JmtDw==
Date: Tue, 6 Aug 2024 10:50:04 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Eric Lin <eric.lin@sifive.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Ci-Jyun Wu <dminus@andestech.com>,
	Locus Wei-Han Chen <locus84@andestech.com>,
	Atish Patra <atishp@rivosinc.com>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Xu Yang <xu.yang_2@nxp.com>, Sandipan Das <sandipan.das@amd.com>,
	Guilherme Amadio <amadio@gentoo.org>,
	Changbin Du <changbin.du@huawei.com>,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, vincent.chen@sifive.com,
	greentime.hu@sifive.com
Subject: Re: [PATCH v1 4/5] perf pmu-events: Remove duplicated riscv firmware
 event
Message-ID: <ZrIqDMg7cBVhstYU@x1>
References: <20240805194424.597244-1-irogers@google.com>
 <20240805194424.597244-4-irogers@google.com>
 <CAPqJEFpiy307B4OBHK4WJGjgbVm_woUrdZ+Vy_LSdQ=ECqZX-Q@mail.gmail.com>
 <CAP-5=fWDmdAkJSoncedZTaSgFwG+p3--jywDj9krnXSfkhh6dQ@mail.gmail.com>
 <ZrInOywRKzRmjtKF@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZrInOywRKzRmjtKF@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_065011_170656_4E2D41BE 
X-CRM114-Status: GOOD (  16.48  )
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

T24gVHVlLCBBdWcgMDYsIDIwMjQgYXQgMTA6Mzg6MDdBTSAtMDMwMCwgQXJuYWxkbyBDYXJ2YWxo
byBkZSBNZWxvIHdyb3RlOgo+IE9uIE1vbiwgQXVnIDA1LCAyMDI0IGF0IDA5OjA1OjI2UE0gLTA3
MDAsIElhbiBSb2dlcnMgd3JvdGU6Cj4gPiBPbiBNb24sIEF1ZyA1LCAyMDI0IGF0IDg6NTTigK9Q
TSBFcmljIExpbiA8ZXJpYy5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPiA+IEkndmUgc2VudCBh
IHBhdGNoIHRvIGZpeCBpdCBhbmQgdGhlIHBhdGNoIGFscmVhZHkgbWVyZ2VkLiBUaGFua3MuCj4g
PiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDcxOTExNTAxOC4yNzM1Ni0xLWVy
aWMubGluQHNpZml2ZS5jb20vCgo+ID4gUmlnaHQsIEkgYWxyZWFkeSBjb21tZW50ZWQgdGhpcyBz
aG91bGQgaGF2ZSBnb25lIHRocm91Z2ggdGhlCj4gPiBwZXJmLXRvb2xzLW5leHQgdHJlZToKPiA+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQVAtNT1mVjNOWGtLc0NQMVdIMF9xTFJOcEwr
V3VQOFMzaDE9Y0hhVU1INU1Ga1ZIUWdAbWFpbC5nbWFpbC5jb20vCj4gPiBBcm5hbGRvLCBwbGVh
c2UgdGFrZSBFcmljJ3MgcGF0Y2ggaW4gcHJlZmVyZW5jZSB0byB0aGlzIG9uZS4KCj4gU28gSSBy
ZW1vdmVkIHlvdXIgdmVyc2lvbiBmcm9tIHBlcmYtdG9vbHMtbmV4dCwgZXZlbnR1YWxseSB3ZSds
bCBnZXQKPiB0aGlzIG1lcmdlZCB1cHN0cmVhbSwgSSdtIGp1c3QgY2hlY2tpbmcgdGhpcyBpc24n
dCBnb2luZyB0byBnZXQgaW4gb3VyCj4gd2F5IG9mIHRlc3Rpbmcgd2hhdCB3ZSBoYXZlIGluIHBl
cmYtdG9vbHMtbmV4dC4uLgoKQXMgZXhwZWN0ZWQ6CgrirKJbYWNtZUB0b29sYm94IHBlcmYtdG9v
bHMtbmV4dF0kIGdpdCBsb2cgLS1vbmVsaW5lIC0xIDsgdGltZSBtYWtlIC1DIHRvb2xzL3BlcmYg
YnVpbGQtdGVzdAo8U05JUD4KbWFrZV9ub19saWJkd19kd2FyZl91bndpbmRfTzogY2QgLiAmJiBt
YWtlIE5PX0xJQkRXX0RXQVJGX1VOV0lORD0xIEZFQVRVUkVTX0RVTVA9L2hvbWUvYWNtZS9naXQv
cGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9GRUFUVVJFX0RVTVAgLWoyOCBP
PS90bXAvdG1wLjF4QlRQQ1BKaDEgREVTVERJUj0vdG1wL3RtcC42dXBaUkJoVXBOCiAgICAgICAg
ICBtYWtlX2pldmVudHNfYWxsX086IGNkIC4gJiYgbWFrZSBKRVZFTlRTX0FSQ0g9YWxsIEZFQVRV
UkVTX0RVTVA9L2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERf
VEVTVF9GRUFUVVJFX0RVTVAgLWoyOCBPPS90bXAvdG1wLm5jaktzUzlEZG0gREVTVERJUj0vdG1w
L3RtcC56Mmx4VjQ0anpMCmNkIC4gJiYgbWFrZSBKRVZFTlRTX0FSQ0g9YWxsIEZFQVRVUkVTX0RV
TVA9L2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvQlVJTERfVEVTVF9G
RUFUVVJFX0RVTVAgLWoyOCBPPS90bXAvdG1wLm5jaktzUzlEZG0gREVTVERJUj0vdG1wL3RtcC56
Mmx4VjQ0anpMCiAgQlVJTEQ6ICAgRG9pbmcgJ21ha2UgLWoyOCcgcGFyYWxsZWwgYnVpbGQKV2Fy
bmluZzogS2VybmVsIEFCSSBoZWFkZXIgZGlmZmVyZW5jZXM6CiAgZGlmZiAtdSB0b29scy9pbmNs
dWRlL3VhcGkvZHJtL2k5MTVfZHJtLmggaW5jbHVkZS91YXBpL2RybS9pOTE1X2RybS5oCjxTTklQ
PgogIExEICAgICAgL3RtcC90bXAubmNqS3NTOURkbS91dGlsL3BlcmYtdXRpbC1pbi5vCiAgTEQg
ICAgICAvdG1wL3RtcC5uY2pLc1M5RGRtL3BlcmYtdXRpbC1pbi5vCiAgQVIgICAgICAvdG1wL3Rt
cC5uY2pLc1M5RGRtL2xpYnBlcmYtdXRpbC5hClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBs
YXN0KToKICBGaWxlICIvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9w
bXUtZXZlbnRzL2pldmVudHMucHkiLCBsaW5lIDEzMTcsIGluIDxtb2R1bGU+CiAgICBtYWluKCkK
ICBGaWxlICIvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9wbXUtZXZl
bnRzL2pldmVudHMucHkiLCBsaW5lIDEzMDgsIGluIG1haW4KICAgIGZ0dyhhcmNoX3BhdGgsIFtd
LCBwcm9jZXNzX29uZV9maWxlKQogIEZpbGUgIi9ob21lL2FjbWUvZ2l0L3BlcmYtdG9vbHMtbmV4
dC90b29scy9wZXJmL3BtdS1ldmVudHMvamV2ZW50cy5weSIsIGxpbmUgMTI0NSwgaW4gZnR3CiAg
ICBmdHcoaXRlbS5wYXRoLCBwYXJlbnRzICsgW2l0ZW0ubmFtZV0sIGFjdGlvbikKICBGaWxlICIv
aG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMvcGVyZi9wbXUtZXZlbnRzL2pldmVu
dHMucHkiLCBsaW5lIDEyNDMsIGluIGZ0dwogICAgYWN0aW9uKHBhcmVudHMsIGl0ZW0pCiAgRmls
ZSAiL2hvbWUvYWNtZS9naXQvcGVyZi10b29scy1uZXh0L3Rvb2xzL3BlcmYvcG11LWV2ZW50cy9q
ZXZlbnRzLnB5IiwgbGluZSA2NDYsIGluIHByb2Nlc3Nfb25lX2ZpbGUKICAgIHByaW50X3BlbmRp
bmdfZXZlbnRzKCkKICBGaWxlICIvaG9tZS9hY21lL2dpdC9wZXJmLXRvb2xzLW5leHQvdG9vbHMv
cGVyZi9wbXUtZXZlbnRzL2pldmVudHMucHkiLCBsaW5lIDUxMCwgaW4gcHJpbnRfcGVuZGluZ19l
dmVudHMKICAgIGFzc2VydCBldmVudC5uYW1lICE9IGxhc3RfbmFtZSwgZiJEdXBsaWNhdGUgZXZl
bnQ6IHtsYXN0X3BtdX0ve2xhc3RfbmFtZX0vIGluIHtfcGVuZGluZ19ldmVudHNfdGJsbmFtZX0i
CiAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl4KQXNzZXJ0aW9uRXJyb3I6IER1cGxp
Y2F0ZSBldmVudDogZGVmYXVsdF9jb3JlL2Z3X3NmZW5jZV92bWFfcmVjZWl2ZWQvIGluIHBtdV9l
dmVudHNfX2FuZGVzX2F4NDUKbWFrZVs1XTogKioqIFtwbXUtZXZlbnRzL0J1aWxkOjQ2OiAvdG1w
L3RtcC5uY2pLc1M5RGRtL3BtdS1ldmVudHMvcG11LWV2ZW50cy5jXSBFcnJvciAxCm1ha2VbNV06
ICoqKiBEZWxldGluZyBmaWxlICcvdG1wL3RtcC5uY2pLc1M5RGRtL3BtdS1ldmVudHMvcG11LWV2
ZW50cy5jJwptYWtlWzRdOiAqKiogW01ha2VmaWxlLnBlcmY6NzYzOiAvdG1wL3RtcC5uY2pLc1M5
RGRtL3BtdS1ldmVudHMvcG11LWV2ZW50cy1pbi5vXSBFcnJvciAyCgpTbyBJJ2xsIGhhdmUgdG8g
Y2hlcnJ5IHBpY2sgdGhhdCBwYXRjaCBhbmQgaGF2ZSBpdCBpbiBwZXJmLXRvb2xzLW5leHQsCndl
J2xsIGdldCBub3RpZmllZCBhdCBzb21lIHBvaW50IHRoYXQgbGludXgtbmV4dCBoYXMgdGhlIHNh
bWUgcGF0Y2gsCndpbGwgYWNrIHRoYXQsIGV0Yy4KClBsZWFzZSBzZW5kIHBhdGNoZXMgZm9yIHRo
aXMgYXJlYSBpbiB0aGUgZnV0dXJlIHRvIHRoZSBwZXJmLXRvb2xzLW5leHQKdHJlZS4KCi0gQXJu
YWxkbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=

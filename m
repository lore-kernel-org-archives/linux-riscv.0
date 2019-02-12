Return-Path: <SRS0=gFXo=QT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26344C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 01:24:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF752214DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 12 Feb 2019 01:24:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qF7NnAIL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mac.com header.i=@mac.com header.b="QGLkgNpx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF752214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mac.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PHBtDfghfUDbpl2qEu8NXIVrZw31/HyC8SKsuaNb97c=; b=qF7NnAIL5a1oS7+dH1xM+B2aj
	Q5wPKpwUr5FSX74r3sFdpiLRTJ5yK67/ABSHRotDG5uSaHiPVsjmb07aKo7pmDFS8yajDGMn9yEK5
	g1BA+DccaMGJgh1w/00JAyVBs7Ts1Jy5ySh1prAzSUx7isDJ1uj3oo1uP/K0B0O2HxlRGQMN3TPfG
	915EjMflMsjeHlxNfsAg8SHt8bWVJ9gu/FtuBgKqqP2RRHOzwm778ZR0jVWbCBRKxug71NMdJBTi3
	qUh5qS/gDZPJhshl+XqHPtex9KA1B+rWyIWpX8yUNdIQWVxBOIpvxnia8R7mX2FwTUmF1w0RjW9Wy
	oPkWLzYaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtMo2-0008J0-PP; Tue, 12 Feb 2019 01:24:14 +0000
Received: from mr85p00im-ztdg06021201.me.com ([17.58.23.189])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtMnz-0008IZ-Ct
 for linux-riscv@lists.infradead.org; Tue, 12 Feb 2019 01:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mac.com; s=04042017;
 t=1549934649; bh=bWJg23kmblk+H2ZSZ9gLepRCTThQBwU5TUob9+b9C3s=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type;
 b=QGLkgNpx4JrDqY+egP0aEWaJlBqGeN39eysSV2vlwF82mXXEvmWclLKqdwIPVc+tF
 zmIzm27bif2AMVZoKp5ZoIZVj0cXHQ/KI4w9G0s27kkYN2nQkJr59oxgb82DFfkkyJ
 NiX/ZFAIavSPnSvy4M1U6wNwNBLoXbEPWSQZEdPuLpSHFdT3LWKHECEGdadpLxl+1q
 jFXtSQ/a0lBeT4enutXqzg8OUIAkgPEIC7visYoJN6b600fBDkoijfbFOOwogw13t/
 kQdn5GuafJDEd6gY150KTl2oM38Da9iFgCe473GblWURhdi5nbsqWnaI/VRhEVpu4/
 H6h1mIyVhvmDQ==
Received: from [192.168.0.18] (125-237-34-254-fibre.sparkbb.co.nz
 [125.237.34.254])
 by mr85p00im-ztdg06021201.me.com (Postfix) with ESMTPSA id 2DF05120130;
 Tue, 12 Feb 2019 01:24:08 +0000 (UTC)
Subject: Re: kernel after 5.0-rc2 may not boot using BBL
To: Anup Patel <anup@brainfault.org>, Christoph Hellwig <hch@infradead.org>
References: <CAAhSdy3im4i0PJvKqDAfq2iDFvTA2O3ZsxjM6wSgdnFUU1eVcw@mail.gmail.com>
 <mhng-487587c1-cd66-40f3-86fc-aa2f034f5028@palmer-si-x1c4>
 <CAAhSdy2pBp10bp_jvCnApGYZa4Y2779ELrvH2DgcP4TRiKUzwg@mail.gmail.com>
 <20190211082506.GA13103@infradead.org>
 <CAAhSdy32P5Nn7yePyOHPNXZ5dS-RuxPK60UGebxWRbC8Y4QWRA@mail.gmail.com>
From: Michael Clark <michaeljclark@mac.com>
Message-ID: <81d7ebf7-0055-13bf-d4b2-4bf62227bbdc@mac.com>
Date: Tue, 12 Feb 2019 14:24:05 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhSdy32P5Nn7yePyOHPNXZ5dS-RuxPK60UGebxWRbC8Y4QWRA@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-12_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1902120007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_172411_461489_562294B4 
X-CRM114-Status: GOOD (  28.87  )
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
Cc: Atish Patra <atish.patra@wdc.com>, linux-riscv@lists.infradead.org,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 11/02/19 9:45 PM, Anup Patel wrote:
> On Mon, Feb 11, 2019 at 1:55 PM Christoph Hellwig <hch@infradead.org> wrote:
>>
>> On Sat, Feb 09, 2019 at 09:00:27AM +0530, Anup Patel wrote:
>>> IMHO, best solution would be to use mature open-source bootloader as
>>> payload (i.e. U-Boot or similar) and always boot Linux from bootloader. Using
>>> Linux as BBL/OpenSBI payload can still continue to exist but it can be more
>>> of a developer usage.
>>
>> Yes, that is a good long term plan.  But in the meantime we should not
>> gratiously break the precious setups people got working..

This has been a longstanding issue. I believe some Berkeley graduates 
are in control of the repos (some of them are very intelligent young 
Doctors). However, the Berkeley software doesn't even version numbers. 
We can't call the release management shocking because it is 
non-existent. i.e.it is not even at the linux-0.11 style versioning 
scheme, (although Linus didn't have version control hence tarball's). 
Methinks they don't want CVEs being assigned as that would taint their 
impeccable security reputation. For example, one can't really assign a 
CVE to master:HEAD on a git repo. One needs an actual release. I am sure 
it is deliberate. That said, assigning CVEs to students, with them 
having a black mark at the start of their careers is probably also a bad 
idea.

I think these gratuitous breakages are a ploy, either to demonstrate how 
easily trust can be subverted. i.e. the breakages are actually to troll 
long-standing kernel overdevelops, showing how easy it is to slip in 
breaking changes using the "trusted lieutenants" model, and it is not 
really fixable until someone with release engineering experience takes 
control of the foundation repositories, or the students step up and take 
responsibility for their work, adding due professionalism, such as CI. 
They are getting paid now.

Ideal situation would be gated repository with CI in front that locks 
out changes that regress any of a suite of tests run against the open 
source tools (and now simulation of the underlying open source chip and 
its firmware), core libraries and the kernel. I am aware that some of 
the breakages are deliberate based on traces in GitHub issues, and 
artifacts in the git history. This century's beginning is marked by the 
ubiquity of CI, well, certainly the last decade, so I see no reason why 
it should not be applied here, as these changes would not have made it 
into a project that has CI.

Twerps. They need a punch. Not a gut punch. Just a friendly but firm 
punch, in the shoulder. Serious, but not hard enough to cause any 
permanent injury. In the right shoulder because the left shoulder has 
bursitis, and not onto the bone as that would hurt one's fist. We need 
to think about how to achieve this with a little finesse. Phone books 
don't leave bruises but they are bulky to carry around, especially if 
you lure one of these developers into a bar in a social setting. The 
Phone book will look out of place. I think just a regular firm fist 
punch would be best. We don't want assault charges and we certainly 
wouldn't want an email trail leading back to someone threatening punches 
to key members of the RISC-V community. That could be damaging (insert 
emoji :Grinning Face With Smiling Eyes:). Anyway, they can't get to me 
because I am in another country, so probability of me receiving a 
physical punch is very low, so just a virtual punch, and it would be a 
round of exchanging punches. Like I punch you, you punch me back sort of 
thing. i.e. it needs to be fair.

> The kernel breakage totally unintentional. I had done all testing using BBL
> and OpenSBI with Linux compiled using defconfig but never saw the issue.

I agree with Christoph.

It is no excuse. This is bad because it shows lack of basic testing. 
It's like nobody boot tests riscv-qemu with BBL, which is where all of 
the work on PMP is. In this century, most mature adults are using CI so 
these sorts of changes would never even make it into the master branch 
after checks are made against the PR. I think they are just 
demonstrating how easily trust without verification can be subverted, as 
they have visibly sabotaged attempts to have CI set up for the RISC-V 
port of the kernel, tools and C library. I have evidence of this in 
writing. The commit in BBL that breaks PMP also has terrible code smell 
as it is hidden out-of-line from the existing PNP code, is hard-coded 
for a number of registers that differs from the specification, and the 
writing style is quite different from the other code. We can't even rule 
out the possibility of a forged commit given sha128 weaknesses. There 
are so many vectors for which they can inject breaking changes that go 
undetected without CI. Of course if it was written in ink, we could do 
hand-writing analysis, but in this case it is GitHub keys.

Also, the OpenSBI plan has somehow been made fiat by the RISC-V 
Foundation by recently appearing in its GitHub organization, however, I 
am unsure that it was actually an agreed upon direction. There was no 
public review period. It just appeared from nowhere. Certainly there are 
different consensus processes operating here, one an orthodox one and 
one a heterodox one.

I personally think merges need to be done by a bot, and; the consensus 
from the adults on the mailing list is that SBI should not be required 
for what should be accomplished by drivers; perhaps only to maintain 
backwards compatibility with the silicon that hardly anyone can get 
their hands on. Before I got fired, I was working on the CLIC which 
potentially allowed S-mode to have its own timers and IPIs. I personally 
think not giving S-mode timers and IPIs is kind of dumb. The number of 
flops for another timer and interrupt source is tiny. That said, good 
job from many other angles as there is an open source chip that runs 
Linux and we have Debian. The SBI firmware issue is just roughness 
around the edges and we can't expect everything to be perfect on day 
one, and it shows one can save a few flops (i.e. nanocents) at the 
expense of transitioning to RISC code in M-mode as micro-code using the 
memory bus for state versus one more timer comparator register.

If we have CI, we should test riscv-pk. Many folk are using it and there 
are several derivatives. It is the original boot loader for RISC-V. I've 
been a BBL user for several years. I think it was Dec 2015 when I 
ordered an FPGA to run lowRISC untethered.

BTW Palmer, Thanks for firing me. Last time I had a difficult boss I 
quit, but getting fired is actually better, because we have a 3 month 
stand down for our social security system here in NZ. If one voluntarily 
leaves one's job, one is not entitled to our unemployment benefit. If 
one gets fired, then one is entitled to the benefit immediately. You 
still need to pay us for the work up until December. I guess I got fired 
because I was super annoyed by being blocked from working on CI which 
was in my contract as an exhibit, and was what I volunteered to do. I 
didn't really want to do it anyhow; it is work; it's just something I 
have experience with (Cloud CI yada yada yada). The current setup is 
really bad from what I've used commercially. Also working on Open Source 
under an NDA is a bit weird too. One can be fired at any time for no 
reason. Much worse if I was in California on an H1B, where one 
essentially needs to leave the country if one gets fired. In this case, 
I just need to move somewhere cheaper to live, oddly enough Palmerston 
North (it's not really possible to survive in Auckland on social 
security as rents are comparatively high; like the Bay Area). Lucky I 
was fired before moving. That be much worse for my partner and step-son 
if I was fired after already moving to California. Hope you find someone 
to look after QEMU. If I was getting paid, I wouldn't mind to do some 
part-time work on CI, but I have another project that I want to work on.

Regards,

Michael.


--
Trust without verification is corruption

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
